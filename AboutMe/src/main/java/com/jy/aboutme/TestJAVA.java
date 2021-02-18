package com.jy.aboutme;

public class TestJAVA {

	private int a;
	private int b;
	private static int c;
	
	public static int getC() {
		return c;
	}

	public static void setC(int c) {
		TestJAVA.c = c;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public static void main(String[] args) {
		
		TestJAVA test = new TestJAVA();
		
		TestJAVA.setC(123);
		System.out.println("값 : " + TestJAVA.getC());
		
		
		
		//System.out.println(" a : " + test.getA());
	}

}











