import { 
    bigint, 
    doublePrecision, 
    pgTable, 
    text, 
    timestamp
} from "drizzle-orm/pg-core";


export const venueTable = pgTable("venues", {
    venue_id: bigint("venue_id", { mode: "number" })
      .primaryKey()
      .generatedAlwaysAsIdentity(),
  
    name: text("name").notNull(),
    address: text("address").notNull(),
  
    lat: doublePrecision("lat"), // 처음엔 null 허용
    lng: doublePrecision("lng"),
  
    place_id: text("place_id"), // 자동완성용 (나중에 써도 됨)
  
    created_at: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow(),
  
    updated_at: timestamp("updated_at", { withTimezone: true })
      .notNull()
      .defaultNow(),
  });

export const eventTable = pgTable("events", {
  event_id: bigint("event_id", { mode: "number" })
    .primaryKey()
    .generatedAlwaysAsIdentity(),

    venue_id: bigint("venue_id", { mode: "number" })
    .notNull()
    .references(() => venueTable.venue_id),

  name: text("name").notNull(),
  description: text("description").notNull(),

  start_at: timestamp("start_at", { withTimezone: true }).notNull(),
  end_at: timestamp("end_at", { withTimezone: true }).notNull(),

  created_at: timestamp("created_at", { withTimezone: true })
    .notNull()
    .defaultNow(),

  updated_at: timestamp("updated_at", { withTimezone: true })
    .notNull()
    .defaultNow(),
});

