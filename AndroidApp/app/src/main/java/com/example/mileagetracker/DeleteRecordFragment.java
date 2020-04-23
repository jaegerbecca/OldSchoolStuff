package com.example.mileagetracker;


import android.app.Activity;
import android.app.DatePickerDialog;
import android.content.Context;
import android.os.Bundle;

import androidx.appcompat.widget.AppCompatEditText;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.mileagetracker.databaseClasses.mileage;
import com.google.android.material.textfield.TextInputEditText;

import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


/**
 * A simple {@link Fragment} subclass.
 */
public class DeleteRecordFragment extends Fragment {

    AppCompatEditText recordID;
    Button btnDelete;

    public DeleteRecordFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_delete_record, container, false);
        recordID = view.findViewById(R.id.txtRecordID);
        btnDelete = view.findViewById(R.id.btnDelete);
        try{btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = recordID.getText().toString();
                if(id.matches("^(19|20)\\d\\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$")){
                    DeleteRecordFragment.delRunnable runnable = new DeleteRecordFragment.delRunnable(id);
                    LinkedBlockingQueue taskThreadQueue = new LinkedBlockingQueue<Runnable>();
                    ThreadPoolExecutor executor =
                            new ThreadPoolExecutor(2, 6, 60, TimeUnit.SECONDS, taskThreadQueue);
                    executor.execute(runnable);
                }else{
                    recordID.setText("");
                }
                recordID.setText("");
            }
        });} catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }
    class delRunnable implements Runnable{
        String id;
        delRunnable(String i){this.id=i;};
        @Override
        public void run() {
            try{
            mileage mileages = new mileage();
            mileages.setRecordID(id);
            MainActivity.db.mileageDao().deleteRecord(mileages);}catch (Exception e) {
                e.printStackTrace();}
        }
    }
}
