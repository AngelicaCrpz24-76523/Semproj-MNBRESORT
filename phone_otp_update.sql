-- Run once on an existing database to require a separate phone OTP at registration.
USE mnb_resort;
ALTER TABLE email_otps
    ADD COLUMN IF NOT EXISTS phone_code_hash VARCHAR(255) NULL AFTER code_hash,
    ADD COLUMN IF NOT EXISTS phone_attempts TINYINT UNSIGNED NOT NULL DEFAULT 0 AFTER phone_code_hash,
    ADD COLUMN IF NOT EXISTS phone_expires_at DATETIME NULL AFTER phone_attempts;
