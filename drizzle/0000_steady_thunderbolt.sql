CREATE TABLE "events" (
	"event_id" bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "events_event_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1),
	"venue_id" bigint NOT NULL,
	"name" text NOT NULL,
	"description" text NOT NULL,
	"start_at" timestamp with time zone NOT NULL,
	"end_at" timestamp with time zone NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "venues" (
	"venue_id" bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "venues_venue_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1),
	"name" text NOT NULL,
	"address" text NOT NULL,
	"lat" double precision,
	"lng" double precision,
	"place_id" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "events" ADD CONSTRAINT "events_venue_id_venues_venue_id_fk" FOREIGN KEY ("venue_id") REFERENCES "public"."venues"("venue_id") ON DELETE no action ON UPDATE no action;