package com.example.mileagetracker.databaseClasses;

import androidx.room.Database;
import androidx.room.RoomDatabase;

@Database(entities = mileage.class, version=2, exportSchema = false)
public abstract class AppDatabase extends RoomDatabase {
    public abstract mileageDao mileageDao();
}
