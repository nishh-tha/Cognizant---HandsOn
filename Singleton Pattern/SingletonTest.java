public class SingletonTest {
    public static void main(String[] args){
        Logger l1 = Logger.getInstance();
        Logger l2 = Logger.getInstance();

        if(l1 == l2){
            System.out.println("Only one instance created.");
        }
    }
}
