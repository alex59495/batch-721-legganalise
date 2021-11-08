class AddAnalysisToLabAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_column :lab_analyses, :sm_nd, :boolean, default: false
    add_column :lab_analyses, :sr_sr, :boolean, default: false
    add_column :lab_analyses, :c_o, :boolean, default: false
    add_column :lab_analyses, :u_pb_ign, :boolean, default: false
    add_column :lab_analyses, :u_pb_det, :boolean, default: false
    add_column :lab_analyses, :u_pb_carb, :boolean, default: false
    add_column :lab_analyses, :imag, :boolean, default: false
    add_column :lab_analyses, :mev, :boolean, default: false
    add_column :lab_analyses, :selfrag, :boolean, default: false
    add_column :lab_analyses, :pulv, :boolean, default: false
  end
end
