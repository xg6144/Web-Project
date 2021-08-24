package parking;

import java.util.EmptyStackException;
import java.util.Scanner;
import java.util.Stack;

import db.List_DB;

public class Parking_Process {
    private static final int ALREADY_CAR = 1;
    private static final int NO_CAR = 0;
    private int state;
    private String car_num;

    Scanner scanner = new Scanner(System.in);
    
    //menu
    public void menu(){
        while(true){
            System.out.println("1 : Insert || 2 : Out || 3 : Exit || 4 : Info");
            try{
                state = Integer.parseInt(scanner.nextLine());
            }catch (NumberFormatException e){
                e.printStackTrace();
            }finally {
                switch (state) {
                    case 1 -> input_car();
                    case 2 -> delete_car_option();
                    case 3 -> System.exit(0);
                    case 4 -> parking_info();
                    default -> System.out.println("Wrong Input");
                }
            }
        }
    }

    private String return_car_num(){
        System.out.println("Enter Car Number : ");
        car_num = scanner.nextLine();
        return car_num;
    }

    private int check_car_num(String car_num, Stack<String> park){

        for(int i=0; i < park.size(); i++){
            if(park.get(i).equals(car_num)){
                return ALREADY_CAR;
            }
        }
        return NO_CAR;
    }

    private void input_car(){
        car_num = return_car_num();

        if(check_car_num(car_num, List_DB.getInstance().park1) == NO_CAR
                && check_car_num(car_num, List_DB.getInstance().park2) == NO_CAR
                && check_car_num(car_num, List_DB.getInstance().park3) == NO_CAR
                && check_car_num(car_num, List_DB.getInstance().park4) == NO_CAR) {
            if (List_DB.getInstance().park1.size() < 4) {
                List_DB.getInstance().park1.push(car_num);
            }else if (List_DB.getInstance().park2.size() < 4) {
                List_DB.getInstance().park2.push(car_num);
            }else if (List_DB.getInstance().park3.size() < 4) {
                List_DB.getInstance().park3.push(car_num);
            }else if (List_DB.getInstance().park4.size() < 4) {
                List_DB.getInstance().park4.push(car_num);
            }else {
                System.out.println("Full");
            }
        }else{
            System.out.println("The number already exists.");
        }
    }
    private int return_loop(int idx, Stack<String> park){
        int loop = 0;

        if(park.size() == 1){
            if (idx == 0){
                loop = 1;
            }
        }else if(park.size() == 2){
            if(idx == 0){
                loop = 2;
            }else {
                loop = 1;
            }
        }else if(park.size() == 3){
            if(idx == 0){
                loop = 3;
            }else if(idx == 1){
                loop = 2;
            }else{
                loop = 1;
            }
        }else{
            if(idx == 0){
                loop = 4;
            }else if(idx == 1){
                loop = 3;
            }else if(idx == 2){
                loop = 2;
            }else{
                loop = 1;
            }
        }
        System.out.println(loop);
        return loop;
    }
    private boolean delete_rear(int idx, Stack<String> park){
        boolean result = false;
        int total_size = park.size();

        if(total_size == 4){
            if(idx == 3){
                park.remove(idx);
                result = true;
            }
        }else if(total_size == 3){
            if(idx == 2){
                park.remove(idx);
                result = true;
            }
        }else if(total_size == 2){
            if(idx == 1){
                park.remove(idx);
                result = true;
            }
        }else{
            if(idx == 0){
                park.remove(idx);
                result = true;
            }
        }
        return result;
    }
    private void delete_car_process(Stack<String> park){
        //차량의 인덱스를 찾는다.
        int idx = park.indexOf(car_num);
        int loop = return_loop(idx, park);
        boolean rear = delete_rear(idx, park);
        //해당하는 인덱스의 값 제거


        if(!rear) {
            for(int i=0; i < loop - 1; i++){
                String temp = park.peek();
                List_DB.getInstance().temp_array.push(temp);
                park.pop();
            }
            park.remove(idx);
            //임시 저장된 값 다시 삽입
            return_temp(park);
        }
    }
    private void delete_car_option(){
        try{
            car_num = return_car_num();


            //첫번째 주차 공간에 찾는 번호가 있으면
            if(List_DB.getInstance().park1.contains(car_num)){
                delete_car_process(List_DB.getInstance().park1);
            }
            //두번째 주차공간
            else if(List_DB.getInstance().park2.contains(car_num)){
                delete_car_process(List_DB.getInstance().park2);
            }
            //세번째 주차공간
            else if(List_DB.getInstance().park3.contains(car_num)){
                delete_car_process(List_DB.getInstance().park3);
            }
            //네번째 주차공간
            else if(List_DB.getInstance().park4.contains(car_num)){
                delete_car_process(List_DB.getInstance().park4);
            }
            else {
                System.out.println("No Car");
            }
        }catch (EmptyStackException e){
            e.printStackTrace();
        }
    }
    private void return_temp(Stack<String> park){
        //임시 저장소에 저장된 값을 다시 넣는다.
        int total_size = List_DB.getInstance().temp_array.size();
        for(int i=0; i < total_size; i++){
            park.push(List_DB.getInstance().temp_array.get(i));
        }

        List_DB.getInstance().temp_array.clear();
    }

    private void parking_info(){
        for(int i=0; i < List_DB.getInstance().parking_area.size(); i++){
            System.out.println(List_DB.getInstance().parking_area.get(i));
        }
    }
}
