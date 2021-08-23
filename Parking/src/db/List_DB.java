package db;

import java.util.ArrayList;
import java.util.Stack;

public class List_DB {
    private static List_DB instance = new List_DB();
    private List_DB(){
        parking_area.add(park1);
        parking_area.add(park2);
        parking_area.add(park3);
        parking_area.add(park4);
    }

    public static List_DB getInstance(){
        return instance;
    }

    public Stack<String> park1 = new Stack<>();
    public Stack<String> park2 = new Stack<>();
    public Stack<String> park3 = new Stack<>();
    public Stack<String> park4 = new Stack<>();

    public Stack<Stack<String>> parking_area = new Stack<>();

    public ArrayList<String> temp_array = new ArrayList<>();
}
