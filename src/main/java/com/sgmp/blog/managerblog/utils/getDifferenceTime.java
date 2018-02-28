package com.sgmp.blog.managerblog.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class getDifferenceTime {
    /**
     * 两个时间相差距离多少天多少小时多少分多少秒
     * @param strTime1 时间参数 1 格式：2016-06-22 18:21:20
     * @param strTime2 时间参数 2 格式：2016-06-22 17:21:20
     * @param timeFormat 日期格式 yyyy-MM-dd HH:mm:ss    毫秒(yyyy-MM-dd HH:mm:ss.SSS)
     * @return String 返回值为：xx天xx小时xx分xx秒xx毫秒
     */
    public final static String TIMEFORMATSTR="yyyyMMddHHmmss";
    public final static String TIMEFORMAT="yy-MM-dd HH:mm:ss";

    public static String getDifferenceTime(String strTime1, String strTime2, String timeFormat) {
        DateFormat df = new SimpleDateFormat(timeFormat);
        Date stime1;
        Date stime2;
        long day = 0;
        long hour = 0;
        long min = 0;
        long sec = 0;
        long ms = 0;
        try {
            stime1 = df.parse(strTime1);
            stime2 = df.parse(strTime2);
            long time1 = stime1.getTime();
            long time2 = stime2.getTime();
            long diff ;
            if(time1 < time2) {
                diff = time2 - time1;
            } else {
                diff = time1 - time2;
            }
            day = diff / (24 * 60 * 60 * 1000);
            hour = (diff / (60 * 60 * 1000) - day * 24);
            min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
            sec = (diff/1000-day*24*60*60-hour*60*60-min*60);
            ms = (diff - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min * 60 * 1000 - sec * 1000);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String time="";
        if(sec!=0||min!=0||hour!=0||day!=0){
           time=sec+"秒前";
            if(min!=0||hour!=0||day!=0){
                time="";
                time=min+"分钟前";
                if(hour!=0||day!=0){
                    time="";
                    time=hour+"小时前";
                    if(day!=0){
                        time="";
                        time=day+"天前";
                    }
                }
            }

        }
        return time;
        //return day + "天" + hour + "小时" + min + "分" + sec + "秒" + ms + "毫秒";
    }

    public static void main(String[] args) {
        String differenceTime = getDifferenceTime("2016-06-22 18:21:20", "2016-06-22 18:21:60", "yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        System.out.println(simpleDateFormat.format(new Date())+(int)Math.random()*10);
    }
}
