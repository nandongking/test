/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.test.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.co.test.service.TestService;
import kr.co.test.service.TestVO;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("testService")
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TestServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "testDAO")
	private TestDAO testDAO;
	// TODO mybatis 사용
//	  @Resource(name="testMapper")
//		private TestMapper testDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;


	public TestVO selectTest(TestVO vo) throws Exception {
		System.out.println("TestServiceImpl.java");
		TestVO result = testDAO.selectTest(vo);
		System.out.println("sssssssssss");
		return result;
	}
	
	

	@Override
	public List<?> selectSampleList(SampleDefaultVO searchVO) throws Exception {
		return testDAO.selectSampleList(searchVO);
	}

	@Override
	public int selectSampleListTotCnt(SampleDefaultVO searchVO) {
		return testDAO.selectSampleListTotCnt(searchVO);
	}
}
