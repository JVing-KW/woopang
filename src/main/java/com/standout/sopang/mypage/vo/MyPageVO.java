package com.standout.sopang.mypage.vo;


import lombok.*;
import org.springframework.stereotype.Component;


//���߿� @Setter �����
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
//@Setter
@Component("myPageVO")
public class MyPageVO {
	private String member_id;
	private String beginDate;
	private String endDate;



}
