package com.example.mileagetracker;


import android.os.Bundle;

import androidx.appcompat.widget.AppCompatEditText;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.mileagetracker.databaseClasses.mileage;
import com.google.android.material.textfield.TextInputEditText;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


/**
 * A simple {@link Fragment} subclass.
 */
public class EditRecordFragment extends Fragment {

    AppCompatEditText mID, mStart, mEnd, mRate;
    Button btnEdit;

    public EditRecordFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_edit_record, container, false);
        mStart=view.findViewById(R.id.txtStart); mEnd=view.findViewById(R.id.txtEnd);
        mRate=view.findViewById(R.id.txtRate); btnEdit = view.findViewById(R.id.btnEdit);
        mID=view.findViewById(R.id.txtRecordID);

        try{btnEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = mID.getText().toString();
                float start, end, rate;
                try{
                start = (Float.parseFloat(mStart.getText().toString()));
                    try{
                        end = (Float.parseFloat(mEnd.getText().toString()));
                        try{
                            rate = (Float.parseFloat(mRate.getText().toString()));
                            EditRecordFragment.editRunnable runnable = new EditRecordFragment.editRunnable(id, start, end, rate);
                            LinkedBlockingQueue taskThreadQueue = new LinkedBlockingQueue<Runnable>();
                            ThreadPoolExecutor executor =
                                    new ThreadPoolExecutor(2, 6, 60, TimeUnit.SECONDS, taskThreadQueue);

                            if(id.matches("^(19|20)\\d\\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$")){
                                if(start>=0){
                                    if(end>=0) {
                                        if ((mRate != null) && (rate >= 0)) {
                                            executor.execute(runnable);
                                            mID.setText("");
                                            mStart.setText("");
                                            mEnd.setText("");
                                            mRate.setText("");
                                        }
                                        else{
                                            mRate.setText("");
                                        }
                                    }
                                    else{
                                        mEnd.setText("");
                                    }
                                }
                                else{
                                    mStart.setText("");
                                }
                            }
                            else{
                                mID.setText("");
                            }
                        }
                        catch (NumberFormatException ex){
                            mRate.setText("");
                        }
                    }
                    catch (NumberFormatException ex){
                        mEnd.setText("");
                    }
                }
                catch (NumberFormatException ex){
                    mStart.setText("");
                }
            }
        });} catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }
    class editRunnable implements Runnable{
        String mID;
        float mStart, mEnd, mRate;
        editRunnable(String id, float s, float e, float r){this.mID=id; this.mStart=s; this.mEnd=e; this.mRate=r; };
        @Override
        public void run() {
            mileage mileage = new mileage();
            mileage.setRecordID(mID);
            mileage.setStartMiles(mStart);
            mileage.setEndMiles(mEnd);
            mileage.setMileageRate(mRate);
            MainActivity.db.mileageDao().updateRecord(mileage);
        }
    }
}
