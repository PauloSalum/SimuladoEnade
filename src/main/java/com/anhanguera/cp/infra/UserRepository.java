package com.anhanguera.cp.infra;

import com.anhanguera.cp.model.Users.User;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by PauloMagno on 04/06/2015.
 */
public interface UserRepository extends CrudRepository<User,Long> {
}
