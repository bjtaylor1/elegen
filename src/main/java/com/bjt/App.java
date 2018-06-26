package com.bjt;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class App 
{
    public static void main( String[] args )
    {
        try {
            final Pattern pattern = Pattern.compile("(\\d+)\\|LINESTRING\\((.*)\\)");
            final Scanner scanner = new Scanner(System.in);
            while (scanner.hasNext()) {
                final String line = scanner.nextLine();
                if(line == null || line.trim().isEmpty()) {
                    break;
                }

                final Matcher matcher = pattern.matcher(line);
                if (!matcher.matches()) {
                    throw new Exception("Doesn't match");
                }
                final String id = matcher.group(1);
                final String latLongsString = matcher.group(2);
                final String[] latLongs = latLongsString.split(",");
                for(final String latLong : latLongs) {
                    final String[] latLongPair = latLong.split(" ");
                    final String lon = latLongPair[0];
                    final String lat = latLongPair[1];
                    System.out.println(String.format("%s,%s,%s", id, lat, lon));
                }

            }
        } catch(final Exception ex) {
            System.out.println(ex);
            System.exit(1);
        }
    }
}
