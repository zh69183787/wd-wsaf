package com.wonders.frame.cpq.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.cpq.model.bo.CpqAnswer;


@Controller
@RequestMapping("/cpqAnswer")
public class CpqAnswerController extends AbstractGenericController<CpqAnswer>{

}
