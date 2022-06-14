"""empty message

Revision ID: 46b24b2f3c31
Revises: d1cc7660ff22
Create Date: 2022-04-08 16:40:50.897443

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '46b24b2f3c31'
down_revision = 'd1cc7660ff22'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('squad', sa.Column('VicePres', sa.String(length=40), nullable=True))
    op.add_column('squad', sa.Column('Stadio', sa.String(length=40), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('squad', 'Stadio')
    op.drop_column('squad', 'VicePres')
    # ### end Alembic commands ###
