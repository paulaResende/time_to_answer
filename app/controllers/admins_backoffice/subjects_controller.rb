class AdminsBackoffice::SubjectsController < AdminsBackofficeController

  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @subject = Subject.all.page(params[:page])
  end

  def edit; end

  def update
    if @admin.update(params_admin)
      redirect_to "admins_backoffice_subject_path	", notice: "Assunto atualizado com sucesso!"
    else
      render viewquecriarei
    end
  end

  def create
    @subject = Subject.new(params_admin)
    if @subject.save
      redirect_to "new_admins_backoffice_subject_path", notice: "Assunto cadastrado com sucesso!"
    else
      render #viewquecriarei
    end
  end

  def new
    @subject = Subject.new
  end

  def destroy
    if @subject.destroy
      redirect_to "admins_backoffice_subject_path", notice: "Assunto excluído com sucesso!"
    else
      render #viewquecriarei
    end
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end
end
