/**
 * Fitness class with helpful methods
 * to calculate human fitness
 * */
public class Fitness {

    /**
     * calculateBMI method
     * accepts body weight (should be in kg)
     * and body height (should be in meter)
     * returns BMI value
     * */
    public static Decimal calculateBMI(Decimal weight, Decimal height) {
        Decimal result  = weight / (height*height);
        return result;
    }

    /**
     * calculatePace method
     * accepts distance (in km)
     * and minutes
     * returns pace in km/hr
     * */
    public static Decimal calculatePace(Decimal distance, Decimal minutes) {
        Decimal hr = minutes/60;
        Decimal pace = distance / hr;
        return pace;
    }
}
