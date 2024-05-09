package com.example.weekassignment.week2;

public class Singleton { //class 생성
    private static Singleton instance; // 혼자 사용할 수 있는 Singleton 객체 선언

    private Singleton(){ // 생성자
    }

    public static Singleton getInstance(){ // public static으로 외부에서 불러옴
        if(instance==null){
            instance = new Singleton(); // 자기 자신 안의 method니 호출 가능
        }
        return instance;
    }
}


class Main{
    public static void main(String[] args) {
        for (int i = 0; i < 100 ; i++) {
            Singleton singleton = Singleton.getInstance();
            System.out.println(singleton);
            }

    }

}