package com.example.mileagetracker.databaseClasses;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import java.util.List;

@Dao
public interface mileageDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    void addRecord(mileage mileage);

    @Query("SELECT * FROM mileage_records ORDER BY recordID")
    List<mileage> readRecord();

    @Query("SELECT * FROM mileage_records WHERE recordID LIKE :ID")
    List<mileage> readSpecificRecord(String ID);

    @Update(entity = mileage.class)
    void updateRecord(mileage mileage);

    @Delete
    void deleteRecord(mileage mileage);
}
