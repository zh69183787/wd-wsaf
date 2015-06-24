package com.wonders.frame.core.tags.enums;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;
/**
 * @author mengjie
 * 
 * 自定义验证接口@Between，用法：@Between(startDate = "1930-01-01", endDate = "2012-12-31", message = "{..}")  
 *
 */
import com.wonders.frame.core.tags.impl.MatchesValidator;

public enum CaseMode {
    UPPER, LOWER;
}