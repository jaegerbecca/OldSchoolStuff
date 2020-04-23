package com.example.mileagetracker.databaseClasses;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

import java.util.Calendar;
import java.util.Date;

@Entity(tableName = "mileage_records")
public class mileage {
    @PrimaryKey@NonNull
    private String recordID;
    @ColumnInfo(name = "start")
    private float startMiles;
    @ColumnInfo(name = "end")
    private float endMiles;
    @ColumnInfo(name = "rate")
    private float mileageRate;

    public String getRecordID() {
        return recordID;
    }

    public void setRecordID(String recordID) {
        this.recordID = recordID;
    }

    public float getStartMiles() {
        return startMiles;
    }

    public void setStartMiles(float startMiles) {
        this.startMiles = startMiles;
    }

    public float getEndMiles() {
        return endMiles;
    }

    public void setEndMiles(float endMiles) {
        this.endMiles = endMiles;
    }

    public float getMileageRate() {
        return mileageRate;
    }

    public void setMileageRate(float mileageRate) {
        this.mileageRate = mileageRate;
    }
}
