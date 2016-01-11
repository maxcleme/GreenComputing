(**
  QuickSort.ocaml - performs quicksort on a list of ints.
  @author Anupam Garg
*)
(**
  recursive quicksort -
  performs quicksort on a list. if there is more than 1 element in
  the list, we define and use partition.
  @param list the list to quicksort
let rec quicksort list =
  match list with
  | [] -> []
  | [x] -> [x]
  | pivot::rest ->
*)
      (**
        recursive partition -
        partitions a list such that elements to the left of the pivot
        are less than or equal to the pivot, and elements to the right
        are strictly larger than the pivot. the pivot is chosen to be
        the first element of the list;
        @param left the elements less than or equal to the pivot
        @param right the elements strictly grater than the pivot
        @param list the list to partition
      let rec partition left right list =
        match list with
        | [] -> quicksort left @ (pivot :: quicksort right)
        | head::tail -> if head <= pivot then partition (head::left) right tail
                                         else partition left (head::right) tail
      in partition [] [] rest;;
      *)

let rec quicksort list cont =
    match list with
    | [] -> cont []
    | element::[] -> cont [element]
    | pivot::rest ->
        let left, right = List.partition (fun element -> element < pivot) rest in
        quicksort left (fun sorted_left ->
        quicksort right (fun sorted_right ->
        cont (sorted_left @ [pivot] @ sorted_right)))

let qsort li = quicksort li (fun x -> x)

let myArray = ref [];;
let ic = open_in "/home/m2iagl/clement/GreenComputing/random" in
try 
	while true do
		let line = input_line ic in
		myArray := (int_of_string line)::(!myArray)
	done
with
	| End_of_file ->
	close_in_noerr ic;;

qsort (!myArray);


