import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Sort {

	private static final int ARRAY_SIZE = 10000000;

	public static void main(String[] args) throws IOException {
		int[] array = new int[ARRAY_SIZE];
		BufferedReader reader = new BufferedReader(new FileReader(new File("/home/m2iagl/clement/GreenComputing/random")));

		String content;
		for (int i = 0; i < ARRAY_SIZE; i++) {
			content = reader.readLine();
			array[i] = Integer.parseInt(content);
		}
		
		quickSort(array, 0, ARRAY_SIZE-1);		
	}
	
	static int partition(int arr[], int left, int right)
	{
	      int i = left, j = right;
	      int tmp;
	      int pivot = arr[(left + right) / 2];
	     
	      while (i <= j) {
	            while (arr[i] < pivot)
	                  i++;
	            while (arr[j] > pivot)
	                  j--;
	            if (i <= j) {
	                  tmp = arr[i];
	                  arr[i] = arr[j];
	                  arr[j] = tmp;
	                  i++;
	                  j--;
	            }
	      };
	     
	      return i;
	}
	 
	static void quickSort(int arr[], int left, int right) {
	      int index = partition(arr, left, right);
	      if (left < index - 1)
	            quickSort(arr, left, index - 1);
	      if (index < right)
	            quickSort(arr, index, right);
	}
	
}
