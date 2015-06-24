package com.wonders.frame.tags;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ ElementType.TYPE, ElementType.ANNOTATION_TYPE,ElementType.FIELD,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ShowInView {
	/** 
     * 是否序列号 
     * @return 
     */  
    boolean isSerialID() default false;  

    /** 
     * 字段名称 
     * @return 
     */  
    String name() default "";  
    /** 
     * 是否在列表中显示 
     * @return 
     */  
    boolean isShow() default true;  
    /** 
     * 字段描述 
     * @return 
     */  
    String description() default "";  
    /** 
     * 排序字段 
     * @return 
     */  
    int order() default 0;  
    /** 
    * 是否在列表中显示 
    * @return 
    */  
   boolean isEntity() default true; 
}
