package kr.co.test.service;

import lombok.Data;

/*import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;*/


/*@NoArgsConstructor	// 기본 생성자 생성
@RequiredArgsConstructor   //NonNull이 붙은 필드의 생성자만 생성
@AllArgsConstructor 	// 모든 필드의 생성자 생성
@Getter  // getter
@Setter  // setter
@ToString	// ToString
*/
@Data
public class TestVO {

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;

}
