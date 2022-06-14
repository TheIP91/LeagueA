"""empty message

Revision ID: a0a8ee54e116
Revises: 46b24b2f3c31
Create Date: 2022-04-12 13:41:42.566491

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'a0a8ee54e116'
down_revision = '46b24b2f3c31'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('news',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('category', sa.String(length=10), nullable=False),
    sa.Column('title', sa.String(length=60), nullable=False),
    sa.Column('content', sa.String(length=1400), nullable=True),
    sa.Column('hash1', sa.String(length=10), nullable=True),
    sa.Column('hash2', sa.String(length=10), nullable=True),
    sa.Column('hash3', sa.String(length=10), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('news')
    # ### end Alembic commands ###