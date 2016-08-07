
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
//import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;

public class LaTest {

	// private static final int Integer_MAX = 0;
	// private static final char MAX_VALUE = 0;

	// public static int compareStrings (String s1, String s2){
	// String temp1 = s1 + s2;
	// System.out.println(temp1);
	// String temp2 = s2 + s1;
	// System.out.println(temp2);
	// if (temp1.compareTo(temp2) > 0){
	// return 1;
	// }
	// else if (temp1.compareTo(temp2) < 0){
	// return 1;
	// }
	// return 0;
	// }
	// number of "1" bits in a number

	public static int hammingWeight(int n) {
		int count = 0;
		while (n != 0) {
			n = n & (n - 1);
			count++;
		}
		return count;
	}

	public static class StringComparator implements Comparator<String> {
		public int compare(String s1, String s2) {
			String s1s2 = s1 + s2;
			String s2s1 = s2 + s1;
			if (s1s2.compareTo(s2s1) > 0)
				return -1;
			else if (s1s2.compareTo(s2s1) < 0)
				return 1;
			return 0;
		}
	}

	// Combine of a few numbers to get the largest number
	// For example, given [3, 30, 34, 5, 9], the largest formed number is
	// 9534330
	// #179 Largest Number
	public static String largestNumber(int[] nums) {

		String[] numStr = new String[nums.length];
		int largest = 0;
		for (int i = 0; i < nums.length; i++) {
			numStr[i] = String.valueOf(nums[i]);
			if (nums[i] > largest)
				largest = nums[i];
		}
		if (largest == 0)
			return "0";
		Comparator<String> comparator = new StringComparator();
		Arrays.sort(numStr, comparator);

		StringBuilder str = new StringBuilder();
		for (String s : numStr) {
			str.append(s);
		}
		return str.toString();
	}

	public static void testStringComparasion() {
		String str1 = "85";
		String str2 = "85";
		String str3 = "86";

		int result = str1.compareTo(str2);
		// System.out.println(result);

		result = str2.compareTo(str3);
		// System.out.println(result);

		result = str3.compareTo(str1);
		// System.out.println(result);
	}

	// find how many "1"s if in binary format
	public static int hammingWeight2(int n) {
		int result = 0;
		while (n > 0) {
			n = n & (n - 1);
			result++;
		}

		return result;
	}

	// swap in java array
	public static void swap(int[] arr, int i, int j) {
		int temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}

	public static void shuffle(int[] arr) {
		int len = arr.length;
		for (int i = 0; i < len; i++) {
			int rand = (int) Math.random() * len;
			swap(arr, i, rand);
		}
	}

	// silly, easy, wasteful method
	public int findKthLargest(int[] nums, int k) {
		Arrays.sort(nums);
		int len = nums.length;
		return nums[len - k];
	}

	// # kth largest number
	public int findKthLargestUsingPartition(int[] nums, int k) {
		if (k > nums.length)
			return -1;
		int targetIndex = nums.length - k;
		int pivot = 0;
		shuffle(nums);
		pivot = partitionK(nums, 0, nums.length - 1);
		if (pivot == targetIndex)
			return pivot;
		if (pivot < targetIndex)
			return partitionK(nums, pivot + 1, nums.length - 1);
		else
			return partitionK(nums, 0, pivot - 1);

	}

	public static int partitionK(int[] nums, int start, int end) {
		int index = start;
		// if (pivot == nums.length - k) return pivot;
		for (int i = start; i < end; i++) {
			if (nums[i] < nums[end]) {
				swap(nums, i, index);
				index++;
			}
		}
		swap(nums, index, end);
		return index;
	}

	// quick sort
	public static int partition(int[] arr, int start, int end) {

		// select a pivot, usually the last element for convenience
		int pivotLocation = end;
		int storeIndex = start;
		// swap accordingly
		for (int i = start; i < end; i++) {
			if (arr[i] <= arr[pivotLocation]) {
				swap(arr, i, storeIndex);
				storeIndex++;
			}
		}
		swap(arr, storeIndex, end);
		// end of for loop and pivot is put in place
		// return pivot location
		return storeIndex;
	}

	public static void quicksort(int[] arr, int lo, int hi) {

		if (lo < hi) {
			int pivot = partition(arr, lo, hi);
			partition(arr, lo, pivot - 1);
			partition(arr, pivot + 1, hi);
		}
	}

	// Definition for singly-linked list.
	public class ListNode {
		int val;
		ListNode next;

		ListNode(int x) {
			val = x;
		}
	}

	public class Solution {
		public ListNode swapPairs(ListNode head) {
			// ListNode dummyNode = new ListNode(0);
			ListNode temp, p1, p2, prev;
			p1 = head;
			prev = head;
			if (p1 != null && p1.next != null) {
				head = p1.next;
			}
			while (p1 != null && p1.next != null) {
				p2 = p1.next;
				temp = p2.next;
				prev.next = p2;
				p2.next = p1;
				p1.next = temp;
				prev = p1;
				p1 = temp;
			}
			return head;
		}
	}

	public int findIndexForValue(int[] nums, int target) {
		for (int i = 0; i < nums.length; i++) {
			if (nums[i] == target) {
				return i;
			}
		}
		return -1;
	}

	// two sum
	public int[] twoSum(int[] nums, int target) {

		int[] results = new int[] { -1, -1 };

		int length = nums.length;
		if (length < 2)
			return results;

		HashSet<Integer> hash = new HashSet<Integer>();
		Integer intObj = new Integer(nums[0]);
		hash.add(intObj);
		for (int i = 1; i < length; i++) {
			int valueToSearch = target - nums[i];
			Integer searchVal = new Integer(valueToSearch);
			if (hash.contains(searchVal)) {
				int index0 = findIndexForValue(nums, valueToSearch);
				results[0] = index0 + 1;
				results[1] = i + 1;
				return results;
			} else {
				intObj = new Integer(nums[i]);
				hash.add(intObj);
			}
		}
		return results;
	}

	public static class Pair {
		int a;
		int b;

		Pair() {
			a = 0;
			b = 0;
		}

		Pair(int s, int e) {
			a = s;
			b = e;
		}
	}

	public static List<Pair> twoSumPairs(int[] arr, int sum) {
		List<Pair> results = new ArrayList<Pair>();

		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 0; i < arr.length; i++) {
			int match = sum - arr[i];
			if (map.containsKey(match)) {
				Pair p = new Pair(arr[i], match);
				results.add(p);
				int val = map.get(match);
				val--;
				if (val <= 0) {
					map.remove(match);
				} else {
					map.put(match, val);
				}
			} else {
				if (!map.containsKey(arr[i])) {
					map.put(arr[i], 1);
				} else {
					int val = map.get(arr[i]);
					val++;
					map.put(arr[i], val);
				}
			}
		}
		return results;
	}

	// Longest Substring Without Repeating Characters
	// Assume ASCII char// not passing leetcode test
	public int lengthOfLongestSubstringASCII(String s) {

		int maxLen = 0;
		int currentLen = 0;
		int[] chart = new int[256];
		int start = 0;
		// init
		for (int i = 0; i < 256; i++) {
			chart[i] = -1;
		}
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (chart[c] != -1) {
				currentLen = i - start;
				maxLen = Math.max(currentLen, maxLen);
				start = chart[c] + 1;
			}
			chart[c] = i;

		}
		return maxLen;
	}

	// used too long time TODO
	// #3 Longest Substring Without Repeating Characters
	public int lengthOfLongestSubstring(String s) {
		if (s == null || s.length() == 1)
			return 0;
		int pre = 0;
		int maxL = 1;

		HashMap<Character, Integer> map = new HashMap<Character, Integer>();

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (map.containsKey(c)) {
				maxL = Math.max((i - pre), maxL);
				pre = Math.max(pre, map.get(s.charAt(i)) + 1);// prevent pre to
																// go back. Why?
			}
			map.put(s.charAt(i), i);
		}

		return Math.max(maxL, s.length() - pre);
	}

	// not so cool solution
	public void sortColors1(int[] A) {
		int len = A.length;
		int n0 = 0;
		int n1 = 0;

		for (int i = 0; i < len; i++) {
			if (A[i] == 0)
				n0++;
			else if (A[i] == 1)
				n1++;
		}
		for (int i = 0; i < n0; i++) {
			A[i] = 0;
		}
		for (int i = n0; i < n0 + n1; i++) {
			A[i] = 1;
		}
		for (int i = n0 + n1; i < len; i++) {
			A[i] = 2;
		}

	}

	// Better solution. REVIEW
	public void sortColors2(int[] A) {
		int len = A.length;
		int low = 0;
		int hi = len - 1;

		for (int i = 0; i < len; i++) {
			if (A[i] == 0) {
				swap(A, low, i);
				low++;
			} else if (A[i] == 2)
				swap(A, hi, i);
			hi--;
		}
	}

	public List<List<Integer>> threeSum(int[] nums) {
		List<List<Integer>> results = new ArrayList<List<Integer>>();
		if (nums.length < 3) {
			return results;
		}
		Arrays.sort(nums);

		for (int i = 0; i < nums.length - 2; i++) {
			if (i == 0 || nums[i] > nums[i - 1]) {

				int negate = -nums[i];
				int start = i + 1;
				int end = nums.length - 1;

				while (start < end) {
					if (nums[start] + nums[end] == negate) {// found a triple
						List<Integer> tempL = new ArrayList<Integer>();
						tempL.add(nums[i]);
						tempL.add(nums[start]);
						tempL.add(nums[end]);
						results.add(tempL);
						start++;
						end--;
						// here are 2 conditions to avoid duplicated
						while (start < end && nums[end] == nums[end + 1])
							end--;
						while (start < end && nums[start] == nums[start - 1])
							start++;
					} else if (nums[start] + nums[end] < negate) {
						start++;
					} else {
						end--;
					}
				} // end while, the operation for each i
			} // end if i == 0 etc
		}// end for loop
		return results;
	}

	// Rotate an array of n elements to the right by k steps.
	// For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated
	// to [5,6,7,1,2,3,4].
	public void rotate(int[] nums, int k) {
		k = k % nums.length; // k can be a very large number
		if (k > 0 && k < nums.length) {
			reverse(nums, 0, nums.length - 1);
			reverse(nums, 0, k - 1);
			reverse(nums, k, nums.length - 1);
		}
	}

	public static void reverse(int[] nums, int i, int j) {
		while (i < j) {
			int temp = nums[i];
			nums[i] = nums[j];
			nums[j] = temp;
			i++;
			j--;
		}
	}

	// find the index of the largest element
	public static int indexMax(int[] nums) {
		int max = 0;
		int maxi = 0;
		for (int i = 0; i < nums.length; i++) {
			if (nums[i] > max) {
				max = nums[i];
				maxi = i;
			}
		}
		return maxi;
	}

	// start validate sudoku
	public boolean isValidSudoku(char[][] board) {
		boolean isAllValidChars = isAllValidChars(board);
		if (!isAllValidChars)
			return false;
		// check row and col
		for (int i = 0; i <= 8; i++) {
			if (isUnique1to9(board, i, i, 0, 8) == false)
				return false;
			if (isUnique1to9(board, 0, 8, i, i) == false)
				return false;
		}
		// check region
		for (int i = 0; i <= 2; i++) {
			for (int j = 0; j <= 2; j++) {
				if (isUnique1to9(board, i * 3, (i * 3) + 2, j * 3, (j * 3) + 2) == false)
					return false;
			}
		}
		return true;
	}

	public static boolean isUnique1to9(char[][] board, int row1, int row2, int col1,
			int col2) {
		HashSet<Character> cset = new HashSet<Character>();
		for (int i = row1; i <= row2; i++) {
			for (int j = col1; j <= col2; j++) {
				Character c = new Character(board[i][j]);
				if (cset.contains(c)) {
					return false;
				} else if (c != '.') {
					cset.add(c);
				}
			}
		}
		return true;
	}

	private static boolean isAllValidChars(char[][] board) {
		int len = board[0].length;
		for (int i = 0; i < len; i++) {
			for (int j = 0; j < len; j++) {
				if (!isValidChar(board[i][j])) {
					return false;
				}
			}
		}
		return true;
	}

	private static boolean isValidChar(char ch) {
		if (ch == '.' || (ch >= '1' && ch <= '9'))
			return true;
		return false;
	}

	// end validate sudoku

	public double myPow(double x, int n) {
		if (n == 0 || x == 1.0)
			return 1.0;
		if (n < 0) {
			n = -n;
			x = 1 / x;
		}
		double res = myPow(x, n / 2);
		if (n % 2 == 0)
			return res * res;
		else
			return res * res * x;
	}

	public int maxArea(int[] height) {
		int lo = 0;
		int hi = height.length - 1;
		int smaller = 0;
		smaller = Math.min(height[lo], height[hi]);
		if (height[hi] < smaller) {
			smaller = height[hi];
		}
		int maxArea = smaller * (hi - lo);

		while (lo < hi) {
			if (height[lo] < height[hi]) {
				lo++;
			} else {
				hi--;
			}
			smaller = Math.min(height[lo], height[hi]);
			int area = smaller * (hi - lo);
			maxArea = Math.max(maxArea, area);
		}

		return maxArea;
	}

	// #6 Zigzag COPYPASTED. TODO: Think later
	public String convert(String s, int numRows) {
		// allocate a matrix
		if (s == null || s.length() == 0 || numRows <= 0)
			return "";
		if (numRows == 1)
			return s;
		StringBuilder res = new StringBuilder();
		int size = 2 * numRows - 2;
		for (int i = 0; i < numRows; i++) {
			for (int j = i; j < s.length(); j += size) {
				res.append(s.charAt(j));
				if (i != 0 && i != numRows - 1 && j + size - 2 * i < s.length())
					res.append(s.charAt(j + size - 2 * i));
			}
		}
		return res.toString();
	}

	// merge

	public class Interval {
		int start;
		int end;

		Interval() {
			start = 0;
			end = 0;
		}

		Interval(int s, int e) {
			start = s;
			end = e;
		}
	}

	// TODO
	// public List<Interval> merge(List<Interval> intervals) {
	// Collections.sort(intervals, (Interval o1, Interval o2) -> o1.start -
	// o2.start);
	//
	//
	// }
	//
	// #161

	public boolean isOneEditDistance(String s, String t) {
		int m = s.length();
		int n = t.length();
		if (m - n > 1 || m - n > -1)
			return false;
		if (m > n)
			return isOneEditDistance(t, s);

		// TODO,

		return false;
	}

	// #159leetcode[159] Longest Substring with At Most Two Distinct Characters
	public static int longestSubStringwith2Chars(String s) {
		if (s.length() == 0)
			return 0;
		int maxLen = 0;
		char[] arr = s.toCharArray();
		int len = arr.length;
		int p1 = 0, p2 = -1, start = 0;
		for (int i = 0; i < len; i++) {
			if (p2 == -1) {
				if (arr[i] == arr[p1])
					continue;
				// else
				p2 = i;
			}
			if (arr[i] == arr[p1] || arr[i] == arr[p2]) {
				if (arr[i] == arr[p1])
					p1 = i;
				if (arr[i] == arr[p2])
					p2 = i;
			} else {
				// reset start
				start = Math.min(p1, p2) + 1;
				if (p1 < p2)
					p1 = i;
				else
					p2 = i;

			}
			int currentLen = Math.max(p1, p2) - start + 1;
			if (currentLen > maxLen) {
				maxLen = currentLen;
			}
		}
		//
		if (p2 == -1)
			return arr.length;
		return maxLen;
	}

	// #20 valid parentheses. Not using map
	public boolean isValidParenthese(String s) {
		int len = s.length();
		if (s == null || len == 0 || len == 1 || len % 2 != 0) {
			return false;
		}
		Stack<Character> stack = new Stack<Character>();
		stack.push(s.charAt(0));
		for (int i = 1; i < len; i++) {
			if (s.charAt(i) == '(' || s.charAt(i) == '{' || s.charAt(i) == '[') {
				stack.push(s.charAt(i));
			} else {// pop accordingly
				if (s.charAt(i) == ')' && stack.peek() == '(') {
					stack.pop();
				} else if (s.charAt(i) == ']' && stack.peek() == '[') {
					stack.pop();
				} else if (s.charAt(i) == '}' && stack.peek() == '{') {
					stack.pop();
				} else
					return false;
			}
		}
		if (stack.isEmpty())
			return true;
		else
			return false;
	}

	// @"tOmBONiBth85InPoOyOeBTfTRSEk7ZV4KtATqttTT7M=";//NE pre-pro
	// @"dhdKLi7J9tjs9Sw0ox5Rb4nxzDh9U7TRKXPOFdewB5E=";

	// #20 valid parentheses. using map
	public boolean isValidParenthese2(String s) {
		Map<Character, Character> m = new HashMap<Character, Character>();
		m.put('(', ')');
		m.put('[', ']');
		m.put('{', '}');
		char temp;
		Stack<Character> ps = new Stack<Character>();
		for (int i = 0; i < s.length(); i++) {
			temp = s.charAt(i);
			if (m.containsKey(temp)) {
				ps.push(temp);
			}
			if (m.containsValue(temp)) {
				if (ps.empty())
					return false;
				if (temp == m.get(ps.peek())) {
					ps.pop();
				} else {
					return false;
				}
				;
			}
		}
		if (ps.empty())
			return true;
		else
			return false;
	}

	// #14
	public String longestCommonPrefix(String[] strs) {
		StringBuilder sb = new StringBuilder();
		if (strs.length > 0) {
			int depth = Integer.MAX_VALUE;
			for (int i = 0; i < strs.length; i++) {
				if (strs[i] == null)
					return sb.toString();
				if (depth > strs[i].length())
					depth = strs[i].length();
			}

			boolean match = true;
			for (int i = 0; i < depth; i++) {
				char c = strs[0].charAt(i);
				for (int j = 1; j < strs.length; j++) {
					if (strs[j].charAt(i) != c)
						match = false;
				}
				if (match)
					sb.append(c);
				else
					break;
			}
		}
		return sb.toString();
	}

	// #125
	public static boolean isPalindrome(String s) {
		int len = s.length();
		if (len == 0)
			return true;
		s.toLowerCase();
		s.replaceAll("[\\W]|_", ""); // "[^A-Za-z0-9 ]"
		int lo = 0;
		int hi = len - 1;
		while (lo < hi) {
			if (s.charAt(lo) != s.charAt(hi))
				return false;
			lo++;
			hi--;
		}
		return true;
	}

	// #20 Valid Parentheses
	public static List<String> generateParenthesis(int n) {
		List<String> results = new ArrayList<String>();
		generateParenthesisHelper(n, 0, 0, results, "");
		return results;
	}

	public static void generateParenthesisHelper(int n, int open, int close,
			List<String> results, String currentString) {
		if (open < close)
			return;
		if (open == n && close == n) {
			results.add(currentString);
		} else {
			if (open < n)
				generateParenthesisHelper(n, open + 1, close, results, currentString
						+ "(");
			generateParenthesisHelper(n, open, close + 1, results, currentString + ")");
		}
	}

	// #17 Letter Combinations of a Phone Number
	public List<String> letterCombinations2(String digits) {
		List<String> results = new ArrayList<String>();
		if (digits.length() == 0)
			return results;
		String[] mappings = { " ", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv",
				"wxyz" };
		StringBuilder temp = new StringBuilder();
		temp.append("");
		phoneNumsHelper(digits, mappings, 0, temp, results);

		return results;
	}

	private void phoneNumsHelper(String digits, String[] mappings, int level,
			StringBuilder temp, List<String> results) {
		if (temp.length() == level) {
			results.add(temp.toString());
			return; // need to return
		}
		// found what's the index of the current digit mapping is on the
		// Mappings.
		int indexAtMappings = digits.charAt(level) - '0';
		// found how many chars (depth) that digits represents
		int depth = mappings[indexAtMappings].length();
		for (int i = 0; i < depth; i++) {
			temp = temp.append(mappings[indexAtMappings].charAt(i));
			phoneNumsHelper(digits, mappings, level + 1, temp, results);
			temp.deleteCharAt(temp.length() - 1); // remove the last char that
													// was just added since it's
													// just already used
		}
	}

	// #17 Letter Combinations of a Phone Number
	public List<String> letterCombinations(String digits) {

		ArrayList<String> results = new ArrayList<String>();
		if (digits.length() == 0)
			return results;
		String[] dict = { " ", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv",
				"wxyz" };
		StringBuilder temp = new StringBuilder();
		letterCombinationsHelper(digits, dict, 0, temp, results);

		return results;
	}

	public void letterCombinationsHelper(String digits, String[] dict, int level,
			StringBuilder temp, ArrayList<String> results) {
		if (level == digits.length()) {
			results.add(temp.toString());
			return;
		}
		int index = digits.charAt(level) - '0';
		for (int i = 0; i < dict[index].length(); i++) {
			temp.append(dict[index].charAt(i));
			letterCombinationsHelper(digits, dict, level + 1, temp, results);
			temp.setLength(temp.length() - 1);
		}
	}

	public class TreeNode {
		int val;
		TreeNode left;
		TreeNode right;

		TreeNode(int x) {
			val = x;
		}
	}

	public List<Integer> preorderTraversal(TreeNode root) {
		List<Integer> result = new ArrayList<Integer>();
		if (root == null)
			return result;
		TreeNode current = root;
		Stack<TreeNode> stack = new Stack<TreeNode>();
		while (!stack.isEmpty() || current != null) {
			if (current != null) {
				result.add(current.val);
				if (current.right != null)
					stack.push(current.right);

				current = current.left;
			} else {
				current = stack.peek();
				stack.pop();
			}

		}
		return result;
	}

	public List<Integer> inorderTraversal(TreeNode root) {
		List<Integer> result = new ArrayList<Integer>();
		if (root == null)
			return result;
		TreeNode current = root;
		Stack<TreeNode> stack = new Stack<TreeNode>();
		while (!stack.isEmpty() || current != null) {
			if (current != null) {
				stack.push(current);
				current = current.left;
			} else { // stack is not empty
				current = stack.pop();
				result.add(current.val);
				current = current.right;
			}
		}
		return result;
	}

	public List<Integer> postorderTraversal(TreeNode root) {
		List<Integer> result = new ArrayList<Integer>();
		if (root == null)
			return result;
		TreeNode current = root;
		TreeNode lastvisited = null;
		Stack<TreeNode> stack = new Stack<TreeNode>();
		while (!stack.isEmpty() || current != null) {
			if (current != null) {
				stack.push(current);
				current = current.left;
			} else { // stack is not empty

				TreeNode peekNode = stack.peek();
				// if right node is valid and is not visited, set current to the
				// peek.right
				if (peekNode.right != null && peekNode.right != lastvisited) {
					current = peekNode.right;
				} else // rightnode is visited, or not valid right node, visit
						// node and pop it
				{
					result.add(peekNode.val);
					lastvisited = stack.pop();
				}
			}
		}
		return result;
	}

	// using twisted pre-order
	public List<Integer> postorderTraversal2(TreeNode root) {
		List<Integer> result = new ArrayList<Integer>();
		if (root == null)
			return result;
		TreeNode current = root;
		Stack<TreeNode> stack = new Stack<TreeNode>();
		while (current != null || !stack.isEmpty()) {
			if (current != null) {
				result.add(current.val);
				if (current.left != null) {
					stack.push(current.left);
				}
				current = current.right;
			} else {
				current = stack.pop();
			}
		}// end while

		Collections.reverse(result);
		return result;
	}

	// #200 Number of Islands
	public int numIslands(char[][] grid) {
		int count = 0;
		if (grid.length == 0) {
			return 0;
		}
		for (int i = 0; i < grid.length; i++) {
			for (int j = 0; j < grid[0].length; j++) {
				if (grid[i][j] == '1') {
					count++;
					sweep(i, j, grid);
				}
			}
		}
		return count;
	}

	public void sweep(int row, int col, char[][] grid) {
		if (row < 0 || row > grid.length || col < 0 || col > grid[0].length)
			return;
		if (grid[row][col] == '0' || grid[row][col] == '2')
			return;
		else
			grid[row][col] = '2';

		sweep(row - 1, col, grid);
		sweep(row + 1, col, grid);
		sweep(row, col - 1, grid);
		sweep(row, col + 1, grid);
	}

	// 111 Minimum Depth of Binary Tree

	// #112 Path Sum
	public boolean hasPathSum(TreeNode root, int sum) {
		if (root == null)
			return false;
		else if (root.left == null && root.right == null && sum - root.val == 0)
			return true;
		return (hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum
				- root.val));
	}

	// TODO #113 Path Sum II
	public List<List<Integer>> pathSum(TreeNode root, int sum) {
		List<List<Integer>> resultList = new ArrayList<List<Integer>>();
		if (root == null)
			return resultList;
		Stack<Integer> path = new Stack<Integer>();
		pathSumHelper(root, sum, path, resultList);
		return resultList;
	}

	public void pathSumHelper(TreeNode root, int sum, Stack<Integer> path,
			List<List<Integer>> resultList) {
		path.push(root.val);
		if (root.left == null && root.right == null)
			if (sum == root.val)
				resultList.add(new ArrayList<Integer>(path));
		if (root.left != null)
			pathSumHelper(root.left, sum - root.val, path, resultList);
		if (root.right != null)
			pathSumHelper(root.right, sum - root.val, path, resultList);
		path.pop();
	}

	// #125 word ladder
	public int ladderLength(String beginWord, String endWord, Set<String> wordDict) {
		if (beginWord == null || endWord == null || wordDict.size() == 0)
			return 0;
		if (beginWord == endWord)
			return 1;
		HashSet<String> past = new HashSet<String>();
		HashSet<String> current = new HashSet<String>();
		past.add(endWord);
		wordDict.add(beginWord);
		int count = 1;
		while (past.size() > 0) {
			if (past.contains(beginWord))
				return count;
			current = new HashSet<String>(); // each time get a new current set
			for (String str : past) {
				current = findAllOneEditWords(str, wordDict, current);
			}
			past = current;
			count++;
		}

		return 0;
	}

	private static HashSet<String> findAllOneEditWords(String s, Set<String> wordDict,
			HashSet<String> current) {
		int len = s.length();
		StringBuilder sb = new StringBuilder(s);

		for (int i = 0; i < len; i++) {
			for (char c = 'a'; c <= 'z'; c++) {
				if (c != s.charAt(i)) {
					sb.setCharAt(i, c);
					if (wordDict.contains(sb.toString())) {
						current.add(sb.toString());
						wordDict.remove(sb.toString());
					}
					sb = new StringBuilder(s);
				}
			}
		}
		return current;
	}

	// #209 Minimum Size Subarray Sum
	public int minSubArrayLen(int s, int[] nums) {
		int left = 0;
		int right = 0;
		int count = 0;
		int minCount = nums.length + 1;
		int sum = 0;
		while (left < nums.length && right < nums.length) {
			while (left < nums.length && right < nums.length && sum < s) {
				sum += nums[right];
				right++;
				count++;
			}
			if (sum >= s) {
				minCount = Math.min(count, minCount);
				left++;
				right = left;
				sum = 0;
				count = 0;
			}
		}
		if (minCount <= nums.length)
			return minCount;
		return 0;
	}

	// #202 is Happy number
	public static boolean isHappy(int n) {
		if (n == 1)
			return true;
		HashSet<Integer> s = new HashSet<Integer>();
		if (n < 0) {
			n = 0 - n;
		}
		int result = 0;
		while (n > 0) {
			int temp = n % 10;
			result += Math.pow(temp, 2);
			n = n / 10;
			if (n == 0) {
				// System.out.println("result is" + result);
				if (result == 1)
					return true;
				if (s.contains(result))
					return false;
				else {
					s.add(result);
				}
				n = result;
				result = 0;
			}
		}
		return false;
	}

	// #121 Best Time to Buy and Sell Stock
	public int maxProfit(int[] prices) {
		if (prices.length < 2)
			return 0;
		int minV = prices[0];
		int maxV = 0;
		for (int i = 0; i < prices.length; i++) {

			minV = Math.min(minV, prices[i]);
			maxV = Math.max(maxV, prices[i] - minV);
		}
		return maxV;
	}

	// #123 Best Time to Buy and Sell Stock III
	public int maxProfit3(int[] prices) {
		if (prices == null)
			return 0;
		int len = prices.length;
		if (len < 2)
			return 0;
		// allocate 4 arrays
		int[] dp1 = new int[len];
		int[] mins = new int[len];
		int[] dp2 = new int[len];
		int[] maxes = new int[len];
		// initialize first value for each array
		dp1[0] = 0;
		mins[0] = prices[0];
		dp2[len - 1] = 0;
		maxes[len - 1] = prices[len - 1];

		for (int i = 1; i < len; i++) {
			mins[i] = Math.min(mins[i - 1], prices[i]);
			dp1[i] = Math.max(dp1[i - 1], prices[i] - mins[i]);
		}

		for (int i = len - 2; i >= 0; i--) {
			maxes[i] = Math.max(prices[i], maxes[i + 1]);
			dp2[i] = Math.max(dp2[i + 1], maxes[i] - prices[i]);
		}

		int maxprofit = 0;
		for (int i = 0; i < len; i++) {
			if ((dp1[i] + dp2[i]) > maxprofit) {
				maxprofit = (dp1[i] + dp2[i]);
			}
		}
		return maxprofit;
	}

	// #63 Unique Paths II
	public static int uniquePathsWithObstacles(int[][] obstacleGrid) {
		// using 1D solution array
		int m = obstacleGrid.length;
		int n = obstacleGrid[0].length;
		int[] results = new int[n];
		for (int i = 0; i < n; i++) {
			results[i] = 1;
		}
		for (int i = 1; i < m; i++) {
			for (int j = 1; j < n; j++) {
				if (obstacleGrid[i][j] == 1) {
					results[j] = 0;
				} else {
					results[j] = results[j] + results[j - 1];
				}
			}
		}
		return results[n - 1];
	}

	// #87 Scramble String
	public boolean isScramble(String s1, String s2) {
		if (s1.length() != s2.length())
			return false;
		if (s1.length() == 1 && s2.length() == 1)
			return s1.charAt(0) == s2.charAt(0);
		// find if s1 and s2 are made of same sets of alphabet
		char[] c1 = s1.toCharArray();
		char[] c2 = s2.toCharArray();
		Arrays.sort(c1);
		Arrays.sort(c2);
		if (!new String(c1).equals(new String(c2))) {
			return false;
		}

		int len = s2.length();

		for (int i = 1; i < s1.length(); i++) {
			String s10 = s1.substring(0, i);
			String s11 = s1.substring(i);
			String s20 = s2.substring(0, i);
			String s21 = s2.substring(i);

			String s02 = s2.substring(len - i);
			String s12 = s2.substring(0, len - i);

			if (isScramble(s10, s20) && isScramble(s11, s21))
				return true;

			if (isScramble(s10, s02) && isScramble(s11, s12))
				return true;
		}
		return false;
	}

	// #91 Decode Ways
	public int numDecodings(String s) {
		int len = s.length();
		if (len == 0)
			return 0;
		if (s.charAt(len - 1) == '0')
			return 0;
		if (len == 1)
			return 1;
		int[] demo = new int[len + 1];// in java, all initialized to 0 by
										// default.
		demo[len] = 1;
		demo[len - 1] = 1;
		for (int i = len - 2; i >= 0; i--) {
			if (s.charAt(i) == '0')
				continue;
			if (s.substring(i, i + 1).compareTo("26") > 0) {
				demo[i] = demo[i + 1];
			} else
				demo[i] = demo[i + 1] + demo[i + 2];
		}
		return demo[0];
	}

	// #42 Trapping Rain Water
	public int trap(int[] height) {
		int len = height.length;
		if (len <= 1)
			return 0;
		int total = 0;
		int tallestRight1 = tallestIndex(height, 0, len - 1);
		int tallestLeft1 = tallestRight1;

		int tallestLeft2 = 0;
		// find left
		while (tallestLeft1 > 0) {
			tallestLeft2 = tallestIndex(height, 0, tallestLeft1 - 1);
			if (tallestLeft1 - tallestLeft2 >= 2)
				total += water(height, tallestLeft2, tallestLeft1);
			tallestLeft1 = tallestLeft2;
		}

		int tallestRight2 = len - 1;
		while (tallestRight1 < len) {
			tallestRight2 = tallestIndex(height, tallestRight1 + 1, len - 1);
			if (tallestRight2 - tallestRight1 >= 2)
				total += water(height, tallestRight1, tallestRight2);
			tallestRight1 = tallestRight2;
		}
		return total;
	}

	public static int tallestIndex(int[] a, int start, int end) {
		int tallIndex = start;
		for (int i = start; i <= end; i++) {
			if (a[tallIndex] <= a[i]) {
				tallIndex = i;
			}
		}
		return tallIndex;
	}

	public static int water(int[] a, int start, int end) {
		int water = 0;
		int secondTall = a[start];
		if (a[start] > a[end])
			secondTall = a[end];

		for (int i = start + 1; i < end; i++) {
			water += secondTall - a[i];
		}
		return water;
	}

	// # 221 Maximal Square
	public int maximalSquare(char[][] matrix) {
		if (matrix == null)
			return 0;
		int matrixRowSize = matrix.length;
		if (matrixRowSize == 0)
			return 0;
		int matrixColSize = matrix[0].length;
		if (matrixColSize == 0)
			return 0;
		int[][] res = new int[matrixRowSize][matrixColSize];
		// copy first row
		for (int i = 0; i < matrixColSize; i++)
			res[0][i] = matrix[0][i] - '0';
		// copy first col
		for (int j = 0; j < matrixRowSize; j++)
			res[j][0] = matrix[j][0] - '0';
		int maxsize = res[0][0];
		for (int i = 1; i < matrixRowSize; i++) {
			for (int j = 1; j < matrixColSize; j++) {
				if (matrix[i][j] == '0') {
					res[i][j] = 0;
				} else {
					res[i][j] = minOf3(res[i - 1][j], res[i][j - 1], res[i - 1][j - 1]) + 1;
				}
			}
		}
		for (int i = 0; i < matrixRowSize; i++) {
			for (int j = 0; j < matrixColSize; j++) {
				if (res[i][j] > maxsize)
					maxsize = res[i][j];
			}
		}
		return maxsize * maxsize;
	}

	public static int minOf3(int a, int b, int c) {
		int min = a;
		if (min > b)
			min = b;
		if (min > c)
			min = c;
		return min;
	}

	public static String reverseString(String s) {
		String result = "";
		int len = s.length();
		for (int i = len - 1; i >= 0; i--) {
			result += s.charAt(i);
		}
		return result;
	}

	// public static String reverseString(String s) {
	// if(s==null||s.length() == 0) return s;
	// String result = "";
	// char[] temp = s.toCharArray();
	// int len = s.length();
	// int lo = 0, hi = len - 1;
	// while (lo < hi) {
	// char t = temp[lo];
	// temp[lo] = temp[hi];
	// temp[hi] = t;
	// lo++;
	// hi--;
	// }
	// return temp.toString();
	// }

	public String shortestPalindrome(String s) {
		if (isPalindrome(s))
			return s;

		int len = s.length();
		int t = 0;
		for (t = len; t <= 0; t--) {
			if (isPalindrome(s.substring(0, t))) {
				break;
			}
		}
		t++;
		String reversed = s.substring(t);
		reversed = reverseString(reversed);

		int leng = reversed.length();
		for (int j = 0; j <= leng; j++) {
			String result = reversed.substring(0, j) + s;
			if (isPalindrome(result))
				return result;
		}
		return s;
	}

	// # 128 Longest Consecutive Sequence
	public int longestConsecutive(int[] nums) {
		if (nums.length <= 1)
			return nums.length;
		int result = 0;
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int n : nums) {
			if (map.containsKey(n))
				continue;
			int left = map.containsKey(n - 1) ? map.get(n - 1) : 0;
			int right = map.containsKey(n + 1) ? map.get(n + 1) : 0;
			int sum = 1 + left + right;
			map.put(n, sum);
			result = Math.max(result, sum);
			map.put(n - left, sum);
			map.put(n + right, sum);
		}
		return result;
	}

	// # 46 Permutations
	public List<List<Integer>> permute(int[] nums) {
		List<List<Integer>> results = new ArrayList<List<Integer>>();
		if (nums.length <= 0)
			return results;
		permuteHelper(nums, results, 0);
		return results;
	}

	public static void permuteHelper(int[] nums, List<List<Integer>> results, int level) {
		if (level >= nums.length) {
			List<Integer> sub = new ArrayList<Integer>();
			for (int item : nums) {
				sub.add(item);
			}
			results.add(sub);
		} else {
			for (int i = level; i < nums.length; i++) {
				swap(nums, level, i);
				permuteHelper(nums, results, level + 1);
				swap(nums, i, level);
			}

		}
	}

	public List<String> summaryRanges(int[] nums) {
		List<String> results = new ArrayList<String>();
		int len = nums.length;
		if (len < 1)
			return results;
		StringBuilder sb = new StringBuilder();
		sb.append("");
		sb.append(nums[0]);
		if (len == 1) {
			results.add(sb.toString());
			return results;
		}
		int pre = nums[0];
		for (int i = 1; i < len; i++) {
			if (nums[i] != nums[i - 1] + 1) {
				// end old
				if (nums[i - 1] != pre) {
					sb.append("->");
					sb.append(nums[i - 1]);
				}
				results.add(sb.toString());
				// start new one
				sb.setLength(0);
				sb.append("");
				sb.append(nums[i]);
				pre = nums[i];
			}
		}
		if (nums[len - 1] == nums[len - 2] + 1) {
			sb.append("->");
			sb.append(nums[len - 1]);
		}
		results.add(sb.toString());
		return results;
	}

	public int[] maxSlidingWindow(int[] nums, int k) {
		int len = nums.length;
		if (k > len)
			return null;
		int[] result = new int[0];
		int indexM = indexofMax(nums, 0, k - 1);
		result[0] = nums[indexM];
		for (int i = k, r = 1; i < len; i++, r++) {
			if (nums[k] >= nums[indexM]) {
				indexM = k;
				result[r] = nums[indexM];
			} else {
				if (indexM > i - k) { // in range
					result[r] = nums[indexM];
				} else { // not in range anymore, so need to find a new indexM
					indexM = indexofMax(nums, i - k + 1, i);
					result[r] = nums[indexM];
				}
			}
		}

		return result;
	}

	private static int indexofMax(int[] nums, int s, int e) {
		int mIndex = s;
		for (int i = s + 1; i <= e; i++) {
			if (nums[i] >= nums[mIndex]) {
				mIndex = i;
			}
		}
		return mIndex;
	}

	static int parseInt(String str) throws Exception {
		int len = str.length();
		boolean isNegtive = false;
		if (str.charAt(0) == '-')
			isNegtive = true;

		int start = 0;
		long num = 0;
		if (str.charAt(0) >= '0' && str.charAt(0) <= '9')
			start = 0;
		else {
			if (str.charAt(0) == '-' || str.charAt(0) == '+') {
				start = 1;
			} else {

				throw new Exception("Invalid input at first char");
				// throw new Exception("Some error message");
			}
		}

		for (int i = start; i < len; i++) {
			if (!isDigit(str.charAt(i))) {
				throw new Exception("Invalid input");
			}
			//
			// if (num > (Integer.MAX_VALUE - str.charAt(i)) / 10) {
			// throw new Exception("Some error message");
			// }

			num = num * 10 + str.charAt(i) - '0';
		}

		if (isNegtive == true)
			num = 0 - num;

		if (num < Integer.MIN_VALUE || num > Integer.MAX_VALUE)
			throw new Exception("Number out of bounds");

		return (int) num;

	}

	private static boolean isDigit(char c) {
		return (c >= '0' && c <= '9');
	}

	public static void permuteString(String s) {
		permuteStringHelper("", s);
	}

	private static void permuteStringHelper(String sofar, String rest) {
		if (rest.equals("")) {
			System.out.println(sofar);
		} else {
			for (int i = 0; i < rest.length(); i++) {
				String accumulate = sofar + rest.charAt(i);
				String remain = rest.substring(0, i) + rest.substring(i + 1);
				permuteStringHelper(accumulate, remain);
			}
		}

	}
	public static String iToA(int n){
		int sign = 1;
		if (n < 0) {
			sign = -1;
			n = -n;
		}
		StringBuilder sb = new StringBuilder();
		while (n > 0) {
			sb.append((char)(n % 10 + '0'));
			n /= 10;
		}
		if (sign == -1) {
			sb.append('-');
		}
		return sb.reverse().toString();
	}

	public static void main(String[] args) throws Exception {
		String permuTest = "ABCD";
		permuteString(permuTest);
		int[] arrP = { 0, 1, 8, 9, 8, 2, 1, 2, 3, 4, 10 };
		List<Pair> result = new ArrayList<Pair>();
		result = twoSumPairs(arrP, 10);
		String digS = "2147483647";
		long nu1 = parseInt(digS);
		System.out.println("nu1 is " + nu1);
		boolean happy = isHappy(10);
		if (happy)
			System.out.println("result is happy");
		else
			System.out.println("result is not happy");
		testStringComparasion();
		int[] arrNum = { 6, 9, 43, 46, 0, 4, -1 };
		String s = largestNumber(arrNum);
		System.out.println("largest number is " + s);
		int m = hammingWeight2(10);
		System.out.println("num of 1 is " + m);
		int l = (10) & (9);
		System.out.println("a & b is " + l);

		int[] chart = new int[256];
		for (int i = 0; i < 256; i++) {
			chart[i] = -1;
		}
		chart['A'] = 15;

		System.out.println(chart['A']);
		// test #159
		String testS = "aabbaccccca";
		int length = longestSubStringwith2Chars(testS);
		System.out.println("longest length in " + testS + "is " + length);
		String hello = "Hello";
		String reversed = "";
		reversed = new StringBuilder(hello).reverse().toString();
		String subS = reversed.substring(0, 2);
		System.out.println("**" + subS);
		System.out.println("*reversed*=" + reversed);
		String rslt = subS + hello;
		System.out.println("*result* =" + rslt);
		// convert HashSet to ArrayList
		HashSet<String> hset = new HashSet<String>();

		// add elements to HashSet
		hset.add("Steve");
		hset.add("Matt");
		hset.add("Govinda");
		hset.add("John");
		hset.add("Tommy");

		// Displaying HashSet elements
		System.out.println("HashSet contains: " + hset);

		// Creating a List of HashSet elements
		List<String> list = new ArrayList<String>(hset);

		int[][] foo = new int[][] { new int[] { 0, 0, 0 }, new int[] { 0, 0, 0 },
				new int[] { 1, 0, 0 } };
		int paths = uniquePathsWithObstacles(foo);

		System.out.println("paths: " + paths);
		System.out.println("***************");
		System.out.println("iToA:" + iToA(15));
	}

}

class Interval {
	private int start;
	private int end;
}

class MinStack {
	private Stack<Integer> dataStack = new Stack<Integer>();
	private Stack<Integer> mStack = new Stack<Integer>();

	public void push(int x) {
		dataStack.push(x);
		if (mStack.isEmpty()) {
			mStack.push(x);
		} else {

			int top = mStack.peek();

			if (top >= x) {
				mStack.push(x);
			} else
				mStack.push(top);
		}
	}

	public void pop() {
		dataStack.pop();
		mStack.pop();
	}

	public int top() {

		return dataStack.peek();
	}

	public int getMin() {

		return mStack.peek();
	}
}

// #146 LRU Cache
class LRUCache {
	class DLinkedNode {
		int key;
		int val;
		DLinkedNode pre;
		DLinkedNode next;
	}

	// adding is always happen on head as it's LRU
	private void addNode(DLinkedNode node) {
		node.pre = dummyhead;
		node.next = dummyhead.next;
		dummyhead.next.pre = node;
		dummyhead.next = node;
	}

	// remove any node in the list with dummy head and dummy tail
	private void removeNode(DLinkedNode node) {
		node.pre.next = node.next;
		node.next.pre = node.pre;
	}

	// last accessed note will be moved to head
	private void moveToHead(DLinkedNode node) {
		this.removeNode(node);
		this.addNode(node);
	}

	private DLinkedNode popTail() {
		DLinkedNode remo = dummytail.pre;
		this.removeNode(remo);
		return remo;
	}

	private HashMap<Integer, DLinkedNode> cache = new HashMap<Integer, DLinkedNode>();
	private int count;
	private int capacity;
	private DLinkedNode dummyhead, dummytail;

	void LRUCache(int capacity) {
		this.count = 0;
		this.capacity = capacity;
		dummyhead = new DLinkedNode();
		dummytail = new DLinkedNode();
		dummyhead.pre = null;
		dummyhead.next = dummytail;
		dummytail.pre = dummyhead;
		dummytail.next = null;
	}

	// free the last element from cache and list
	void lruCacheFree() {
		// remove from cache and list
		DLinkedNode tail = this.popTail();
		this.cache.remove(tail.key);
		count--;
	}

	int get(int key) {
		DLinkedNode node = cache.get(key);
		if (node == null)
			return -1;// exception handling
		this.moveToHead(node);
		return node.val;
	}

	void set(int key, int value) {
		DLinkedNode node = cache.get(key);
		// add to cache and head of list
		if (node == null) {
			DLinkedNode newnode = new DLinkedNode();
			newnode.val = value;
			newnode.key = key;
			this.cache.put(key, newnode);
			this.addNode(newnode);
			count++;
			if (count > this.capacity) {
				this.lruCacheFree();
			}
		} else {
			// set value and move to front
			node.val = value;
			this.moveToHead(node);
		}

	}
}

