public class Factorial {

    public static int factorial(int num) {
        if (num < 1) {
            return 1;
        } else {
            return num * factorial(num - 1);
        }
    }
}