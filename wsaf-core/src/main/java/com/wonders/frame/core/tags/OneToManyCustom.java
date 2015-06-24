package com.wonders.frame.core.tags;

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
     * 是否一方 
     * @return 
     */  
    boolean isOne() default false;  

    /** 
     * 是否多方
     * @return 
     */  
    boolean isMany() default false;  
    
    /** 
     * 名称 
     * @return 
     */  
    String name() default "";  
}
