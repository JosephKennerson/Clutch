
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "address_line_1" varchar, "address_line_2" varchar, "city" varchar, "state" varchar, "zip" varchar, "photo" varchar, "first_name" varchar, "last_name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer, "user_id" integer, "is_private" boolean, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comments_on_event_id" ON "comments" ("event_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "rsvps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer, "pending" boolean, "confirmed" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "guest_id" integer);
CREATE INDEX "index_rsvps_on_event_id" ON "rsvps" ("event_id");
CREATE TABLE "ratings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer, "rating" float, "rating_feedback" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rater_id" integer, "ratee_id" integer);
CREATE INDEX "index_ratings_on_event_id" ON "ratings" ("event_id");
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "public_location" varchar, "address_line_1" varchar, "address_line_2" varchar, "city" varchar, "state" varchar, "zip" varchar, "max_size" integer, "time_start" datetime, "time_end" datetime, "name" varchar, "description" text, "category" varchar, "status" boolean, "approval_required" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "host_id" integer);
INSERT INTO schema_migrations (version) VALUES ('20151008235453');

INSERT INTO schema_migrations (version) VALUES ('20151009000450');

INSERT INTO schema_migrations (version) VALUES ('20151009000605');

INSERT INTO schema_migrations (version) VALUES ('20151009000711');

INSERT INTO schema_migrations (version) VALUES ('20151009000808');

INSERT INTO schema_migrations (version) VALUES ('20151009040155');

INSERT INTO schema_migrations (version) VALUES ('20151009040349');

INSERT INTO schema_migrations (version) VALUES ('20151009040404');

INSERT INTO schema_migrations (version) VALUES ('20151009040531');

INSERT INTO schema_migrations (version) VALUES ('20151009221549');

INSERT INTO schema_migrations (version) VALUES ('20151009225705');

INSERT INTO schema_migrations (version) VALUES ('20151009225739');

INSERT INTO schema_migrations (version) VALUES ('20151009225752');

