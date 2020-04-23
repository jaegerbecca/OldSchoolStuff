package com.example.mileagetracker;


import android.os.Bundle;

import androidx.appcompat.widget.AppCompatEditText;
import androidx.fragment.app.Fragment;
import androidx.room.Room;

import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.mileagetracker.databaseClasses.AppDatabase;
import com.example.mileagetracker.databaseClasses.mileage;
import com.google.android.material.textfield.TextInputEditText;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


/**
 * A simple {@link Fragment} subclass.
 */
public class AddRecordFragment extends Fragment {
    AppCompatEditText mid, mStart, mEnd, mRate;
    Button btnAdd;

    public AddRecordFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view= inflater.inflate(R.layout.fragment_add_record, container, false);
        mStart=view.findViewById(R.id.txtStart); mEnd=view.findViewById(R.id.txtEnd); mid=view.findViewById(R.id.txtRecordID);
        mRate=view.findViewById(R.id.txtRate); btnAdd = view.findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String id = mid.getText().toString();
                try{
                float start = Float.parseFloat(mStart.getText().toString());
                    try{
                        float end = Float.parseFloat(mEnd.getText().toString());
                        try{
                            float rate = Float.parseFloat(mRate.getText().toString());
                            try{AddRecordFragment.addRunnable runnable = new addRunnable(id, start, end, rate);
                                LinkedBlockingQueue taskThreadQueue = new LinkedBlockingQueue<Runnable>();
                                ThreadPoolExecutor executor =
                                        new ThreadPoolExecutor(2, 6, 60, TimeUnit.SECONDS, taskThreadQueue);
                                if(id.matches("^(19|20)\\d\\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$")){
                                    if(start>=0){
                                        if(end>=0) {
                                            if (rate >= 0) {
                                                executor.execute(runnable);}
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
                                else{mid.setText("");}
                            } catch (Exception e) {
                                e.printStackTrace();
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

                mid.setText("");
                mStart.setText("");
                mEnd.setText("");
                mRate.setText("");
            }
        });
        return view;
    }

    class addRunnable implements Runnable{
        String id;
        float start, end, rate;
        addRunnable(String i, float s, float e, float r){this.id=i;this.start=s; this.end=e; this.rate=r; };
        @Override
        public void run() {
            mileage mileages = new mileage();
            mileages.setRecordID(id);
            mileages.setStartMiles(start);
            mileages.setEndMiles(end);
            mileages.setMileageRate(rate);
            MainActivity.db.mileageDao().addRecord(mileages);
        }
    }


}
