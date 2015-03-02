/*******************
 * @author Mahesh Laddha
 * $This POJO is not required. We are using EntityStatus POJO for same
 */
package com.infrasofttech.domain.entities;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class ActivityStatusMst extends Base {

	@ManyToOne
	@JoinColumn(name = "fkActivityMstPk")
	private ActivityMst activityMst;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ActivityMst getActivityMst() {
		return activityMst;
	}

	public void setActivityMst(ActivityMst activityMst) {
		this.activityMst = activityMst;
	}

}
