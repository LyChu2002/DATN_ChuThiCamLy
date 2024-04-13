package vn.babycare.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.babycare.model.BaseModel;

@Service
public abstract class BaseService <E extends BaseModel>{
	@PersistenceContext
	EntityManager entityManager;
	
	public abstract Class<E> clazz();
	
	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
	@Transactional
	public E saveOrUpdate(E entity) {
		if(entity.getId() == null || entity.getId() <= 0) {
			entityManager.persist(entity);
			return entity;
		}
		else {
			return entityManager.merge(entity);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql){
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	public E getEntityByNativeSQL(String sql) {
		List<E> list = executeNativeSql(sql);
		if(list.size() > 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
}
