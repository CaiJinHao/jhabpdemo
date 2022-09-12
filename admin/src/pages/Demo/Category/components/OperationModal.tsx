import ProForm, { ModalForm, ProFormText } from '@ant-design/pro-form';
import type { FC } from 'react';
import { useEffect, useState, useMemo } from 'react';
import { ViewOperator } from '@/services/jhabp/app.enums';
import { useIntl } from 'umi';

import * as defaultService from '@/services/Demo/Category/category.service';

type OperationModalProps = {
  operator: ViewOperator;
  visible: boolean;
  onCancel: () => void;
  current?: API.Demo.CategoryDto;
  onSubmit: (values: API.Demo.CategoryDto) => void;
};
const OperationModalCategory: FC<OperationModalProps> = (props) => {
  const { operator, visible, current, onCancel, onSubmit, children } = props;
  const [title, setTitle] = useState<string>();
  const intl = useIntl();
  const [extraProperties, setExtraProperties] = useState<any>();

  const modalFormFinish = async (values: any) => {
    // values.extraProperties = extraProperties;
    if (current) {
      const _data = Object.assign(current, values);
      const updateDto = await defaultService.Update(
        current.id,
        _data as API.Demo.CategoryUpdateInputDto,
      );
      if (updateDto) {
        onSubmit(updateDto);
      }
    } else {
      const _data = values as API.Demo.CategoryCreateInputDto;
      const createDto = await defaultService.Create(_data);
      if (createDto) {
        onSubmit(createDto);
      }
    }
  };
  const operatorTitle = useMemo(() => {
    let _t = intl.formatMessage({ id: 'DisplayName:Category', defaultMessage: '' });

    switch (operator) {
      case ViewOperator.Add:
        {
          _t = `${_t} ${intl.formatMessage({
            id: 'Permission:Create',
            defaultMessage: '创建',
          })}`;
        }
        break;
      case ViewOperator.Edit:
        {
          _t = `${_t} ${intl.formatMessage({
            id: 'Permission:Edit',
            defaultMessage: '编辑',
          })}`;
        }
        break;
      case ViewOperator.Detail:
        {
          _t = `${_t} ${intl.formatMessage({
            id: 'Permission:Detail',
            defaultMessage: '详情',
          })}`;
        }
        break;
      default:
        break;
    }
    return _t;
  }, [intl, operator]);

  useEffect(() => {
    setTitle(operatorTitle);
    // setExtraProperties(current?.extraProperties);
  }, [current, operatorTitle]);

  if (!current && operator != ViewOperator.Add) {
    return <></>;
  }

  return (
    <>
      <ModalForm<API.Demo.CategoryDto>
        width={378}
        visible={visible}
        title={title}
        onFinish={modalFormFinish}
        initialValues={operator == ViewOperator.Add ? {} : current}
        trigger={<>{children}</>}
        modalProps={{
          onCancel: () => onCancel(),
          destroyOnClose: true,
        }}
        submitter={operator == ViewOperator.Detail ? false : {}}
      >
        <>
          <ProForm.Group>
            <ProFormText
              width="md"
              name="name"
              label={intl.formatMessage({ id: 'DisplayName:Category:Name', defaultMessage: '' })}
            />
            <ProFormText
              width="md"
              name="description"
              label={intl.formatMessage({
                id: 'DisplayName:Category:Description',
                defaultMessage: '',
              })}
            />
          </ProForm.Group>
        </>
      </ModalForm>
    </>
  );
};
export default OperationModalCategory;
