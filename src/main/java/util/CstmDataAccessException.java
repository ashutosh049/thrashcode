package util;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.DataAccessException;
public class CstmDataAccessException extends DataAccessException{

	public CstmDataAccessException(String msg, Throwable cause) {
		super(msg, cause);
	}
	public CstmDataAccessException(String msg) {
		super(msg);
	}

}
