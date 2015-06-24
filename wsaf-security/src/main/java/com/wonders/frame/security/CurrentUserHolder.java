package com.wonders.frame.security;


import org.springframework.security.core.context.SecurityContextHolder;

import com.wonders.frame.core.model.vo.TestUser;

public final class CurrentUserHolder {

	private CurrentUserHolder() {
	}

	public static TestUser get() {
		try {
			return (TestUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} catch (ClassCastException e) {
			return null;
		} catch (NullPointerException e) {
			return null;
		}
	}

	public static Integer getId() {
		return get() == null ? null : get().getId();
	}
}
