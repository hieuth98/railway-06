package assigment1;

import java.time.LocalDate;

public class Exam {
	byte Id;
	String Code;
	String Title;
	CategoryQuestion Category;
	short Duration;
	Account Creator;
	LocalDate CreateDate;
	Question[] questions;
}
