package com.wonders.frame.tags.impl;

import java.lang.reflect.InvocationTargetException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

import com.wonders.frame.tags.CheckCase;
import com.wonders.frame.tags.Matches;
import com.wonders.frame.tags.enums.CaseMode;

/**
 * @author mengjie
 * 
 *         matches标签实现类
 * 
 */
public class CheckCaseValidator implements
		ConstraintValidator<CheckCase, String> {

	private CaseMode caseMode;
	private CheckCase annotation;

	public void initialize(CheckCase constraintAnnotation) {
		this.caseMode = constraintAnnotation.value();
		this.annotation = constraintAnnotation;
	}

	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (value == null) {
			return true;
		}

		boolean isValid;

		if (caseMode == CaseMode.UPPER) {
			isValid = value.equals(value.toUpperCase());
		} else {
			isValid = value.equals(value.toLowerCase());
		}

		if (!isValid) {
			context.disableDefaultConstraintViolation();
			context.buildConstraintViolationWithTemplate(
					this.annotation.message()).addConstraintViolation();
		}
		return isValid;
	}

}
