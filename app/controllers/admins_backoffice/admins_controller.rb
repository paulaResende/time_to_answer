class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verify_password_blank, only: [:update]
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all.page(params[:page])
  end

  def edit; end

  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso!"
    else
      render :edit
    end
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado com sucesso!"
    else
      render :new
    end
  end

  def new
    @admin = Admin.new
  end

  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: "Administrador excluído com sucesso!"
    else
      render :index
    end
  end

  private
  def verify_password_blank
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end

  private
  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
