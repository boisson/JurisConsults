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

ActiveRecord::Schema.define(:version => 20131004232222) do

  create_table "advogado_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "advogado_versions", ["item_type", "item_id"], :name => "index_advogado_versions_on_item_type_and_item_id"

  create_table "advogados", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "oab"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.text     "curriculo"
    t.text     "comentario"
    t.string   "situacao"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "advogados_escritorio_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "advogados_escritorio_versions", ["item_type", "item_id"], :name => "index_advogados_escritorio_versions_on_item_type_and_item_id"

  create_table "advogados_escritorios", :force => true do |t|
    t.integer  "escritorio_id"
    t.integer  "advogado_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "advogados_escritorios", ["advogado_id"], :name => "index_advogados_escritorios_on_advogado_id"
  add_index "advogados_escritorios", ["escritorio_id"], :name => "index_advogados_escritorios_on_escritorio_id"

  create_table "andamento_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "andamento_versions", ["item_type", "item_id"], :name => "index_andamento_versions_on_item_type_and_item_id"

  create_table "andamentos", :force => true do |t|
    t.integer  "processo_id"
    t.date     "data"
    t.integer  "tipo_andamento_id"
    t.integer  "situacao_id"
    t.text     "comentario"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "prazo"
  end

  add_index "andamentos", ["processo_id"], :name => "index_andamentos_on_processo_id"
  add_index "andamentos", ["situacao_id"], :name => "index_andamentos_on_situacao_id"
  add_index "andamentos", ["tipo_andamento_id"], :name => "index_andamentos_on_tipo_andamento_id"

  create_table "assunto_processual_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "assunto_processual_versions", ["item_type", "item_id"], :name => "index_assunto_processual_versions_on_item_type_and_item_id"

  create_table "assunto_processuals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "cliente_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "cliente_versions", ["item_type", "item_id"], :name => "index_cliente_versions_on_item_type_and_item_id"

  create_table "clientes", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "cnpj"
    t.integer  "situacao_id"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.text     "comentario"
    t.string   "telefone"
    t.string   "celular"
    t.string   "fax"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "clientes", ["situacao_id"], :name => "index_clientes_on_situacao_id"

  create_table "conta_corrente_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "conta_corrente_versions", ["item_type", "item_id"], :name => "index_conta_corrente_versions_on_item_type_and_item_id"

  create_table "conta_correntes", :force => true do |t|
    t.datetime "date"
    t.integer  "contrato_id"
    t.float    "valor"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "conta_correntes", ["contrato_id"], :name => "index_conta_correntes_on_contrato_id"

  create_table "contrato_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "contrato_versions", ["item_type", "item_id"], :name => "index_contrato_versions_on_item_type_and_item_id"

  create_table "contratos", :force => true do |t|
    t.string   "name"
    t.integer  "processo_id"
    t.float    "valor"
    t.integer  "forma_pagamento_id"
    t.float    "saldo"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "contratos", ["forma_pagamento_id"], :name => "index_contratos_on_forma_pagamento_id"
  add_index "contratos", ["processo_id"], :name => "index_contratos_on_processo_id"

  create_table "escritorio_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "escritorio_versions", ["item_type", "item_id"], :name => "index_escritorio_versions_on_item_type_and_item_id"

  create_table "escritorios", :force => true do |t|
    t.string   "name"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cep"
    t.string   "cidade"
    t.string   "estado"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "forma_pagamento_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "forma_pagamento_versions", ["item_type", "item_id"], :name => "index_forma_pagamento_versions_on_item_type_and_item_id"

  create_table "forma_pagamentos", :force => true do |t|
    t.string   "name"
    t.integer  "tipo_pagamento_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "forma_pagamentos", ["tipo_pagamento_id"], :name => "index_forma_pagamentos_on_tipo_pagamento_id"

  create_table "local_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "local_versions", ["item_type", "item_id"], :name => "index_local_versions_on_item_type_and_item_id"

  create_table "locals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "processo_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "processo_versions", ["item_type", "item_id"], :name => "index_processo_versions_on_item_type_and_item_id"

  create_table "processos", :force => true do |t|
    t.string   "numero"
    t.string   "ano"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.integer  "cliente_id"
    t.integer  "reu_id"
    t.integer  "advogado_id"
    t.integer  "local_id"
    t.integer  "tipo_processo_id"
    t.float    "custas"
    t.float    "honorarios"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "processos", ["advogado_id"], :name => "index_processos_on_advogado_id"
  add_index "processos", ["cliente_id"], :name => "index_processos_on_cliente_id"
  add_index "processos", ["local_id"], :name => "index_processos_on_local_id"
  add_index "processos", ["reu_id"], :name => "index_processos_on_reu_id"
  add_index "processos", ["tipo_processo_id"], :name => "index_processos_on_tipo_processo_id"

  create_table "proteste_auth_users", :force => true do |t|
    t.string   "uid"
    t.text     "info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reu_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "reu_versions", ["item_type", "item_id"], :name => "index_reu_versions_on_item_type_and_item_id"

  create_table "reus", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "cnpj"
    t.string   "contato"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.text     "comentario"
    t.string   "telefone"
    t.string   "celular"
    t.string   "fax"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "situacao_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "situacao_versions", ["item_type", "item_id"], :name => "index_situacao_versions_on_item_type_and_item_id"

  create_table "situacaos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_andamento_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "tipo_andamento_versions", ["item_type", "item_id"], :name => "index_tipo_andamento_versions_on_item_type_and_item_id"

  create_table "tipo_andamentos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_lancamento_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "tipo_lancamento_versions", ["item_type", "item_id"], :name => "index_tipo_lancamento_versions_on_item_type_and_item_id"

  create_table "tipo_lancamentos", :force => true do |t|
    t.string   "name"
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_pagamento_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "tipo_pagamento_versions", ["item_type", "item_id"], :name => "index_tipo_pagamento_versions_on_item_type_and_item_id"

  create_table "tipo_pagamentos", :force => true do |t|
    t.string   "name"
    t.integer  "periodicidade"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tipo_processo_versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "tipo_processo_versions", ["item_type", "item_id"], :name => "index_tipo_processo_versions_on_item_type_and_item_id"

  create_table "tipo_processos", :force => true do |t|
    t.string   "name"
    t.string   "formato"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
