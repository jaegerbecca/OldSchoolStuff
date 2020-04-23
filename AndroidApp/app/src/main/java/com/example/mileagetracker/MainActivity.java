package com.example.mileagetracker;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import androidx.room.Room;

import android.os.Bundle;
import android.provider.Telephony;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.example.mileagetracker.databaseClasses.AppDatabase;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MainActivity extends AppCompatActivity {

    public static AppDatabase db;
    Fragment fragAdd; Fragment fragView; Fragment fragEdit; Fragment fragDelete;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fragAdd = new AddRecordFragment(); fragDelete = new DeleteRecordFragment();
        fragEdit = new EditRecordFragment(); fragView = new ViewRecordFragment();

        dbRunnable runnable = new dbRunnable();
        LinkedBlockingQueue taskThreadQueue = new LinkedBlockingQueue<Runnable>();
        ThreadPoolExecutor executor =
                new ThreadPoolExecutor(2, 6, 60, TimeUnit.SECONDS, taskThreadQueue);
                executor.execute(runnable);

        Spinner specSpinner = (Spinner) findViewById(R.id.fragSpinner);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.fragList, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        specSpinner.setAdapter(adapter);

        specSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                switch (position){

                    case 0:
                        setFragment(fragAdd);
                        break;
                    case 1:
                        setFragment(fragView);
                        break;
                    case 2:
                        setFragment(fragEdit);
                        break;
                    case 3:
                        setFragment(fragDelete);
                        break;
                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }

    public void setFragment(Fragment fragment){
        FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        fragmentTransaction.replace(R.id.fragContainer, fragment);
        fragmentTransaction.commit();
    }

    class dbRunnable implements Runnable{
        dbRunnable(){};
        @Override
        public void run() {
            db = Room.databaseBuilder(MainActivity.this, AppDatabase.class, "specialtyBuilds").fallbackToDestructiveMigration().build();
        }
    }
}
