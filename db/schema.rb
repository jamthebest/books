# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120601004728) do

  create_table "books", :force => true do |t|
    t.string   "titulo"
    t.string   "autor"
    t.string   "tipo"
    t.string   "descripcion"
    t.integer  "edicion"
    t.boolean  "disponibilidad"
    t.string   "t_prestamo"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "comentarios", :force => true do |t|
    t.string   "contenido"
    t.integer  "user"
    t.integer  "perfil"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "contenido"
    t.integer  "user"
    t.integer  "book"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "password"
    t.boolean  "sexo"
    t.datetime "fecha_nac"
    t.integer  "reputacion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
