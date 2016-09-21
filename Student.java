package com.geoffzelenka;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;


public class Student {
   private String m_first_name;
   private String m_last_name;
   private String m_campus;
   private Date m_date_of_birth;
   private String m_favorite_color;
    
   public Student(String lastname, String firstname, String campus, String dob, String color) throws ParseException
    {
        m_first_name = firstname;
        m_last_name = lastname;
        m_campus = campus;
        m_favorite_color = color;
        String date_format;
        if(dob.indexOf('-') >= 0)
        {
            date_format = "MM-dd-yyyy";
        } else {
            date_format = "MM/dd/yyyy";
        }
        DateFormat df = new SimpleDateFormat(date_format);
        m_date_of_birth = df.parse(dob);
    }

    public String getLastName()
    {
        return m_last_name;
    }
    public String getCampus()
    {
        return m_campus;
    }
    public Date getDateOfBirth()
    {
        return m_date_of_birth;
    }

    public String toString()
    {
        DateFormat df = new SimpleDateFormat("M/d/yyyy");
        return m_last_name + " " + m_first_name + " " + m_campus + " " +
               df.format(m_date_of_birth) + " " + m_favorite_color;
    }
}
