import java.util.LinkedList;
import java.util.Queue;

public class Stream {
	Queue<Integer> stream;
	int average;
	int windowSize;

	/** Initialize your data structure here. */
	public Stream(int size) {
		this.stream = new LinkedList<Integer>();
		// List <String> ls = new LinkedList<String>();
		this.average = 0;
		this.windowSize = size;
	}

	public double next(int val) {

		while (stream.size() < windowSize) {
			average = (average * stream.size() + val) / (stream.size() + 1);
			stream.offer(val);
		}
		int dif = val - stream.poll();
		stream.offer(val);
		return average += dif / (windowSize);

	}
}