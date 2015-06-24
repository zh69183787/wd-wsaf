package com.wonders.frame.tags;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ ElementType.TYPE, ElementType.ANNOTATION_TYPE,ElementType.FIELD,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OneToManyCustom {
	/** 
     * 是否序列号 
     * @return 
     */  
    boolean isOne() default false;  

    /** 
     * 是否在列表中显示 
     * @return 
     */  
    boolean isMany() default false;  
    /** 
     * 是否序列号 
     * @return 
     */  
    boolean isOneMethod() default false;  
    
    /** 
     * 是否在列表中显示 
     * @return 
     */  
    boolean isManyMethod() default false;  
}
