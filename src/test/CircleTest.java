package test;

public class CircleTest {
	int radius;
	public CircleTest() {
	radius = 6500;
	}

	public int getRadius(){
	return radius;
	}

	public void setRadius(int newRadius){
	radius=newRadius;
	}

	public double circleArea(){
	return Math.PI * radius * radius;
	}

	public double circleLength(){
	return 2.0*Math.PI * radius;
	}
}
