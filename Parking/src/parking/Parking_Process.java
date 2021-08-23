package parking;

import java.util.EmptyStackException;
import java.util.Scanner;
import java.util.Stack;

import db.List_DB;

public class Parking_Process {
    List_DB list_DB;
    private int state;
    String car_num;

    Scanner scanner = new Scanner(System.in);
    
    //menu
    public void menu(){
        while(true){
            System.out.println("1 : Insert || 2 : Out || 3 : Exit || 4 : Info");
            state = Integer.parseInt(scanner.nextLine());
            switch(state){
                case 1:
                    input_car();
                    break;
                case 2:
                    delete_car_option();
                    break;
                case 3:
                    System.exit(0);
                    break;
                case 4:
                    parking_info();
                    break;
                default:
                    System.out.println("Wrong Input");
                    break;
            }
        }
    }

    private String return_car_num(){
        System.out.println("Enter Car Number : ");
        car_num = scanner.nextLine();
        return car_num;
    }
    
    private void input_car(){
        car_num = return_car_num();

        if(List_DB.getInstance().park1.size() < 4){
            List_DB.getInstance().park1.push(car_num);
            System.out.println("1 Success");
        }else if(List_DB.getInstance().park2.size() < 4){
            List_DB.getInstance().park2.push(car_num);
            System.out.println("2 Success");
        }else if(List_DB.getInstance().park3.size() < 4){
            List_DB.getInstance().park3.push(car_num);
            System.out.println("3 Success");
        }else if(List_DB.getInstance().park4.size() < 4){
            List_DB.getInstance().park4.push(car_num);
            System.out.println("4 Success");
        }else{
            System.out.println("Full");
        }
    }
    private int return_loop(int idx, Stack<String> park){
        int loop;
        switch (idx) {
            case 0:
                if (park.size() == 1) {
                    loop = 1;
                } else if (park.size() == 2) {
                    loop = 2;
                } else if (park.size() == 3) {
                    loop = 3;
                } else {
                    loop = 4;
                }
                break;
            case 1:
                if (park.size() == 2) {
                    loop = 1;
                } else if (park.size() == 3) {
                    loop = 2;
                } else {
                    loop = 3;
                }
                break;
            case 2:
                if (park.size() == 3) {
                    loop = 1;
                } else {
                    loop = 2;
                }
                break;
            default:
                loop = 1;
                break;
        }
        return loop;
    }
    private void delete_car_process(Stack<String> park){
            //차량의 인덱스를 찾는다.
            int idx = park.indexOf(car_num);

            for(int i=0; i < return_loop(idx, park); i++){
                String temp = park.peek();
                List_DB.getInstance().temp_array.add(temp);

                park.pop();
            }

            //해당하는 인덱스의 값 제거
            park.remove(idx);

            //임시 저장된 값 다시 삽입
            return_temp(park);
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
        if(!List_DB.getInstance().parking_area.isEmpty()){
            System.out.println(List_DB.getInstance().parking_area.toString());
        }
    }
}
