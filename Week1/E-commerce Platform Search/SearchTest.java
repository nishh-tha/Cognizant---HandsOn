public class SearchTest {

    public static Product linearSearch(Product[] products, int targetId) {

        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return products[i];
            }
        }

        return null;
    }

    public static Product binarySearch(Product[] products, int targetId) {

        int low = 0;
        int high = products.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (products[mid].productId == targetId) {
                return products[mid];
            }

            if (products[mid].productId < targetId) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Phone", "Electronics"),
            new Product(103, "Shoes", "Fashion"),
            new Product(104, "Watch", "Accessories"),
            new Product(105, "Bag", "Fashion")
        };

        Product result1 = linearSearch(products, 103);

        if (result1 != null) {
            System.out.println("Linear Search Found:");
            System.out.println("ID: " + result1.productId);
            System.out.println("Name: " + result1.productName);
            System.out.println("Category: " + result1.category);
        } else {
            System.out.println("Product not found.");
        }

        System.out.println();

        Product result2 = binarySearch(products, 103);

        if (result2 != null) {
            System.out.println("Binary Search Found:");
            System.out.println("ID: " + result2.productId);
            System.out.println("Name: " + result2.productName);
            System.out.println("Category: " + result2.category);
        } else {
            System.out.println("Product not found.");
        }
    }
}
