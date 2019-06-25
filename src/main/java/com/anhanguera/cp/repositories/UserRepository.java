package com.anhanguera.cp.repositories;

import com.anhanguera.cp.entities.Users.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/** Created by PauloMagno on 04/06/2015. */
@Repository
public interface UserRepository extends CrudRepository<User, Long> {}
