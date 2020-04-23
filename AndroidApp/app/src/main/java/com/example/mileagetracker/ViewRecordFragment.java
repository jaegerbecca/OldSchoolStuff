package com.example.mileagetracker;


import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.room.Room;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.example.mileagetracker.databaseClasses.AppDatabase;
import com.example.mileagetracker.databaseClasses.mileage;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


/**
 * A simple {@link Fragment} subclass.
 */
public class ViewRecordFragment extends Fragment {

    TextView txtDisplay;
    Button btnView;
    String info;

    public ViewRecordFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_view_record, container, false);
        txtDisplay = view.findViewById(R.id.txtDisplayRecords);
        btnView = view.findViewById(R.id.btnView);

        info = "";

        btnView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    try{ViewRecordFragment.vRunnable runnable = new ViewRecordFragment.vRunnable();
                        LinkedBlockingQueue taskThreadQueue = new LinkedBlockingQueue<Runnable>();
                        ThreadPoolExecutor executor =
                                new ThreadPoolExecutor(2, 6, 60, TimeUnit.SECONDS, taskThreadQueue);
                        executor.execute(runnable); txtDisplay.setText(info);} catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });


        return view;
    }
    class vRunnable implements Runnable{
        vRunnable(){};
        @Override
        public void run() {
            try{
            List<mileage> miles = MainActivity.db.mileageDao().readRecord();

            for(mileage mile : miles){
                String id = mile.getRecordID();
                float start = mile.getStartMiles();
                float end = mile.getEndMiles();
                float rate = mile.getMileageRate();
                float mileD = (end-start);
                float mileR = (mileD*rate);

                info = info+"\n\n"+"Record date: "+id+"\n"+"Starting mileage: "+start+"\n"+"Ending mileage: "+
                        end+"\n"+"Total Miles: "+mileD+"\n"+"Mileage Rate: "+rate+"\n"+"Mileage Reimbursement: "+mileR+"\n";
            }}catch (Exception e){e.printStackTrace();}
        }
    }
}
