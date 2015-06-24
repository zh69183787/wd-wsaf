package com.wonders.frame.core.model.bo;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Ccate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "AF_CCATE")
public class Ccate implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String name;
	private String description;
	private Integer removed;
	private List<Codes> codeses;

	// Constructors

	/** default constructor */
	public Ccate() {
		this.removed=0;
	}

	/** minimal constructor */
	public Ccate(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Ccate(Integer id, String type, String name, String description,
			Integer removed, List<Codes> codeses) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.description = description;
		this.removed = removed;
		this.codeses = codeses;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_af_ccate",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "TYPE", length = 20,  nullable = false)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "NAME", length = 50,  nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "DESCRIPTION", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "REMOVED",  nullable = false)
	public  Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

	 @OneToMany(cascade=CascadeType.REFRESH,fetch=FetchType.EAGER)  
	 @JoinColumn(name="CCATE_ID",updatable=false)
	 @OrderBy("orders asc")
	public List<Codes> getCodes() {
		return codeses;
	}

	public void setCodes(List<Codes> codeses) {
		this.codeses = codeses;
	}
}