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
package kr.co.test.web;

import java.io.FileReader;
import java.io.Reader;
import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.test.service.TestVO;
import kr.co.test.service.TestService;
import kr.co.test.service.TestVO;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
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

@Controller
public class TestController {

	@Resource(name = "testService")
	private TestService testService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = "/rootJson.do")
	@ResponseBody
	public ResponseEntity<?> rootJson() throws Exception {
		System.out.println("===================== 1");
        JSONParser parser = new JSONParser();
        System.out.println("===================== 2");
        // JSON 파일 읽기
        Reader reader = new FileReader("/Users/ramp/git/test/test/src/main/webapp/WEB-INF/jsp/egovframework/example/test/root.json");
        System.out.println("===================== 3");
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
 
        System.out.println("===================== 4");
        System.out.println("jsonObject  : "+jsonObject.toString());
        System.out.println("===================== 5");
        
        return new ResponseEntity<>(jsonObject.toString(), HttpStatus.OK);
        
	}

	
	@RequestMapping(value = "/test1.do")
	public String test1(ModelMap model) throws Exception {
		System.out.println("================ test1.do");
		TestVO result = new TestVO();
		model.addAttribute("result", result);
		return "test/test1";
	}
	
	@RequestMapping(value = "/test2.do")
	public String test2(ModelMap model) throws Exception {
		System.out.println("================ test2.do");
		TestVO result = new TestVO();
		model.addAttribute("result", result);
		return "test/test2";
	}
	
	@RequestMapping(value = "/test3.do")
	public String test3(TestVO vo, ModelMap model) throws Exception {
		System.out.println("================ test3.do");
		System.out.println("testVO.id : "+vo.getId());
		TestVO result = testService.selectTest(vo);
		model.addAttribute("result", result);
		return "test/test3";
	}
	
	@RequestMapping(value = "/viewTest.do")
	public String viewTest(@ModelAttribute("searchVO") SampleDefaultVO searchVO, 
			TestVO vo, ModelMap model) throws Exception {
		System.out.println("=========== view Test");
		System.out.println("vo : "+vo.getId());
		System.out.println("vo.toString : "+vo.toString());
//		TestVO result = new TestVO();
		TestVO result = testService.selectTest(vo);
		System.out.println("============= Query Executed");
		System.out.println("resut.data : "+result.getName());
		model.addAttribute("result", result);
		model.addAttribute("testVO", vo);
		
		
		

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = testService.selectSampleList(searchVO);
		model.addAttribute("resultList", sampleList);

		int totCnt = testService.selectSampleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "test/test1";
	}

}
