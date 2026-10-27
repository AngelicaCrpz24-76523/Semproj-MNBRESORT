-- Run once on an existing database to add the seven-day customer deletion grace period.
USE mnb_resort;
ALTER TABLE users ADD COLUMN deactivated_at DATETIME NULL AFTER is_active;
CREATE INDEX idx_users_deactivation_cleanup ON users(user_role,is_active,deactivated_at);
