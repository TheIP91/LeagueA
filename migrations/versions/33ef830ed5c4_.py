"""empty message

Revision ID: 33ef830ed5c4
Revises: 6e8c6310207a
Create Date: 2022-04-19 12:36:45.100052

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '33ef830ed5c4'
down_revision = '6e8c6310207a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('classifica', 'squadra',
               existing_type=sa.INTEGER(),
               nullable=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('classifica', 'squadra',
               existing_type=sa.INTEGER(),
               nullable=True)
    # ### end Alembic commands ###